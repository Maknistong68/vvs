// Network Status Hook
// Provides network status detection and retry logic

import { useState, useEffect, useCallback, useRef } from 'react';
import { Platform, AppState, AppStateStatus } from 'react-native';
import { logger } from '../logger';
import { RETRY_CONFIG } from '../constants';

export interface NetworkStatus {
  isConnected: boolean;
  isInternetReachable: boolean | null;
  type: 'wifi' | 'cellular' | 'none' | 'unknown';
}

// Simple network check using fetch
async function checkNetworkConnection(): Promise<boolean> {
  try {
    // Try to fetch a tiny resource to check connectivity
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), 5000);

    const response = await fetch('https://www.google.com/generate_204', {
      method: 'HEAD',
      signal: controller.signal,
    });

    clearTimeout(timeoutId);
    return response.ok || response.status === 204;
  } catch {
    return false;
  }
}

/**
 * Hook to monitor network status
 */
export function useNetworkStatus() {
  const [status, setStatus] = useState<NetworkStatus>({
    isConnected: true,
    isInternetReachable: null,
    type: 'unknown',
  });
  const [isChecking, setIsChecking] = useState(false);

  const checkConnection = useCallback(async () => {
    setIsChecking(true);
    try {
      const isConnected = await checkNetworkConnection();
      setStatus(prev => ({
        ...prev,
        isConnected,
        isInternetReachable: isConnected,
      }));

      if (!isConnected) {
        logger.warn('Network connection lost');
      }
    } catch (error) {
      logger.error('Network check failed', error);
      setStatus(prev => ({
        ...prev,
        isConnected: false,
        isInternetReachable: false,
      }));
    } finally {
      setIsChecking(false);
    }
  }, []);

  // Check connection on mount and when app comes to foreground
  useEffect(() => {
    checkConnection();

    const handleAppStateChange = (nextAppState: AppStateStatus) => {
      if (nextAppState === 'active') {
        checkConnection();
      }
    };

    const subscription = AppState.addEventListener('change', handleAppStateChange);

    // Periodic check every 30 seconds
    const interval = setInterval(checkConnection, 30000);

    return () => {
      subscription.remove();
      clearInterval(interval);
    };
  }, [checkConnection]);

  return {
    ...status,
    isChecking,
    refresh: checkConnection,
  };
}

/**
 * Hook for retry logic with exponential backoff
 */
export function useRetry<T>() {
  const [retryCount, setRetryCount] = useState(0);
  const [isRetrying, setIsRetrying] = useState(false);
  const [lastError, setLastError] = useState<Error | null>(null);
  const abortControllerRef = useRef<AbortController | null>(null);

  const reset = useCallback(() => {
    setRetryCount(0);
    setIsRetrying(false);
    setLastError(null);
    if (abortControllerRef.current) {
      abortControllerRef.current.abort();
    }
  }, []);

  const executeWithRetry = useCallback(
    async (
      fn: (signal?: AbortSignal) => Promise<T>,
      options?: {
        maxRetries?: number;
        onRetry?: (attempt: number, error: Error) => void;
      }
    ): Promise<T> => {
      const maxRetries = options?.maxRetries ?? RETRY_CONFIG.maxRetries;
      let attempt = 0;
      let lastErr: Error | null = null;

      // Create new abort controller
      abortControllerRef.current = new AbortController();

      while (attempt <= maxRetries) {
        try {
          setIsRetrying(attempt > 0);
          setRetryCount(attempt);

          const result = await fn(abortControllerRef.current.signal);

          // Success - reset state
          setIsRetrying(false);
          setLastError(null);
          return result;
        } catch (error) {
          lastErr = error instanceof Error ? error : new Error(String(error));
          setLastError(lastErr);

          // Check if aborted
          if (abortControllerRef.current.signal.aborted) {
            throw new Error('Request was cancelled');
          }

          // Last attempt - throw
          if (attempt >= maxRetries) {
            logger.error(`All ${maxRetries} retry attempts failed`, lastErr);
            throw lastErr;
          }

          // Calculate delay with exponential backoff
          const delay = Math.min(
            RETRY_CONFIG.initialDelayMs * Math.pow(RETRY_CONFIG.backoffMultiplier, attempt),
            RETRY_CONFIG.maxDelayMs
          );

          logger.warn(`Retry attempt ${attempt + 1}/${maxRetries} after ${delay}ms`, {
            error: lastErr.message,
          });

          // Call retry callback
          options?.onRetry?.(attempt + 1, lastErr);

          // Wait before retrying
          await new Promise(resolve => setTimeout(resolve, delay));
          attempt++;
        }
      }

      // Should never reach here, but TypeScript needs this
      throw lastErr || new Error('Unknown error during retry');
    },
    []
  );

  const cancel = useCallback(() => {
    if (abortControllerRef.current) {
      abortControllerRef.current.abort();
    }
    reset();
  }, [reset]);

  return {
    executeWithRetry,
    retryCount,
    isRetrying,
    lastError,
    reset,
    cancel,
  };
}

/**
 * Custom hook that combines network status with data fetching
 */
export function useNetworkAwareFetch<T>(
  fetchFn: () => Promise<T>,
  options?: {
    enabled?: boolean;
    retryOnReconnect?: boolean;
  }
) {
  const { isConnected, refresh: refreshNetworkStatus } = useNetworkStatus();
  const { executeWithRetry, isRetrying, retryCount, lastError } = useRetry<T>();
  const [data, setData] = useState<T | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);
  const wasDisconnectedRef = useRef(false);

  const fetchData = useCallback(async () => {
    if (!isConnected) {
      setError(new Error('No internet connection'));
      return;
    }

    setIsLoading(true);
    setError(null);

    try {
      const result = await executeWithRetry(fetchFn);
      setData(result);
    } catch (err) {
      setError(err instanceof Error ? err : new Error(String(err)));
    } finally {
      setIsLoading(false);
    }
  }, [isConnected, executeWithRetry, fetchFn]);

  // Retry when reconnected
  useEffect(() => {
    if (!isConnected) {
      wasDisconnectedRef.current = true;
    } else if (wasDisconnectedRef.current && options?.retryOnReconnect) {
      wasDisconnectedRef.current = false;
      fetchData();
    }
  }, [isConnected, fetchData, options?.retryOnReconnect]);

  // Initial fetch
  useEffect(() => {
    if (options?.enabled !== false) {
      fetchData();
    }
  }, [options?.enabled]);

  return {
    data,
    isLoading,
    error,
    isRetrying,
    retryCount,
    isConnected,
    refetch: fetchData,
    refreshNetworkStatus,
  };
}

export default useNetworkStatus;
