// VVS Application Logger
// Centralized logging utility for debugging and error tracking

import { Platform } from 'react-native';
import { ErrorType, AppError, createAppError } from './constants';

// Log levels
export type LogLevel = 'debug' | 'info' | 'warn' | 'error';

interface LogEntry {
  level: LogLevel;
  message: string;
  timestamp: string;
  context?: Record<string, unknown>;
  error?: Error;
  platform: string;
}

// Configuration
const LOG_CONFIG = {
  enabled: __DEV__, // Enable logging in development
  minLevel: 'debug' as LogLevel,
  includeTimestamp: true,
  includeStackTrace: true,
};

const LOG_LEVELS: Record<LogLevel, number> = {
  debug: 0,
  info: 1,
  warn: 2,
  error: 3,
};

// In-memory log buffer for crash reports
const logBuffer: LogEntry[] = [];
const MAX_BUFFER_SIZE = 100;

function shouldLog(level: LogLevel): boolean {
  if (!LOG_CONFIG.enabled) return false;
  return LOG_LEVELS[level] >= LOG_LEVELS[LOG_CONFIG.minLevel];
}

function formatLogEntry(entry: LogEntry): string {
  const parts: string[] = [];

  if (LOG_CONFIG.includeTimestamp) {
    parts.push(`[${entry.timestamp}]`);
  }

  parts.push(`[${entry.level.toUpperCase()}]`);
  parts.push(entry.message);

  if (entry.context && Object.keys(entry.context).length > 0) {
    parts.push(`\nContext: ${JSON.stringify(entry.context, null, 2)}`);
  }

  if (entry.error && LOG_CONFIG.includeStackTrace) {
    parts.push(`\nStack: ${entry.error.stack || 'No stack trace'}`);
  }

  return parts.join(' ');
}

function addToBuffer(entry: LogEntry): void {
  logBuffer.push(entry);
  if (logBuffer.length > MAX_BUFFER_SIZE) {
    logBuffer.shift();
  }
}

function createLogEntry(
  level: LogLevel,
  message: string,
  context?: Record<string, unknown>,
  error?: Error
): LogEntry {
  return {
    level,
    message,
    timestamp: new Date().toISOString(),
    context,
    error,
    platform: Platform.OS,
  };
}

// Main logger object
export const logger = {
  debug(message: string, context?: Record<string, unknown>): void {
    if (!shouldLog('debug')) return;
    const entry = createLogEntry('debug', message, context);
    addToBuffer(entry);
    console.log(formatLogEntry(entry));
  },

  info(message: string, context?: Record<string, unknown>): void {
    if (!shouldLog('info')) return;
    const entry = createLogEntry('info', message, context);
    addToBuffer(entry);
    console.info(formatLogEntry(entry));
  },

  warn(message: string, context?: Record<string, unknown>): void {
    if (!shouldLog('warn')) return;
    const entry = createLogEntry('warn', message, context);
    addToBuffer(entry);
    console.warn(formatLogEntry(entry));
  },

  error(message: string, error?: unknown, context?: Record<string, unknown>): void {
    const err = error instanceof Error ? error : new Error(String(error));
    const entry = createLogEntry('error', message, context, err);
    addToBuffer(entry);

    // Always log errors, even in production
    console.error(formatLogEntry(entry));

    // In production, you would send this to a crash reporting service
    // Example: Sentry.captureException(err, { extra: context });
  },

  // Get recent logs for debugging
  getRecentLogs(): LogEntry[] {
    return [...logBuffer];
  },

  // Clear log buffer
  clearLogs(): void {
    logBuffer.length = 0;
  },

  // Log API call for debugging
  logApiCall(method: string, endpoint: string, status: 'start' | 'success' | 'error', details?: Record<string, unknown>): void {
    const message = `API ${status.toUpperCase()}: ${method} ${endpoint}`;
    if (status === 'error') {
      this.error(message, undefined, details);
    } else {
      this.debug(message, details);
    }
  },

  // Log user action for analytics/debugging
  logUserAction(action: string, details?: Record<string, unknown>): void {
    this.info(`User Action: ${action}`, details);
  },

  // Log navigation for debugging
  logNavigation(from: string, to: string, params?: Record<string, unknown>): void {
    this.debug(`Navigation: ${from} -> ${to}`, params);
  },

  // Log performance metric
  logPerformance(metric: string, durationMs: number, context?: Record<string, unknown>): void {
    this.debug(`Performance: ${metric} took ${durationMs}ms`, context);
  },
};

// Error boundary helper
export function logErrorBoundary(error: Error, componentStack: string): void {
  logger.error('React Error Boundary caught error', error, {
    componentStack,
    type: 'error_boundary',
  });
}

// Async error handler for unhandled promise rejections
export function setupGlobalErrorHandlers(): void {
  // Note: In React Native, you typically use ErrorUtils for global error handling
  // This is a simplified version for logging purposes

  if (__DEV__) {
    logger.info('Global error handlers initialized');
  }
}

// Performance timing helper
export function createPerformanceTimer(label: string): () => void {
  const startTime = Date.now();
  return () => {
    const duration = Date.now() - startTime;
    logger.logPerformance(label, duration);
  };
}

// API error categorizer
export function categorizeApiError(error: unknown, endpoint: string): AppError {
  const message = error instanceof Error ? error.message : String(error);
  const lowerMessage = message.toLowerCase();

  let type: ErrorType = 'unknown';
  let recoverable = true;

  if (lowerMessage.includes('network') || lowerMessage.includes('fetch') || lowerMessage.includes('timeout')) {
    type = 'network';
    recoverable = true;
  } else if (lowerMessage.includes('unauthorized') || lowerMessage.includes('401')) {
    type = 'auth';
    recoverable = true;
  } else if (lowerMessage.includes('forbidden') || lowerMessage.includes('403')) {
    type = 'permission';
    recoverable = false;
  } else if (lowerMessage.includes('validation') || lowerMessage.includes('invalid')) {
    type = 'validation';
    recoverable = true;
  } else if (lowerMessage.includes('500') || lowerMessage.includes('server')) {
    type = 'server';
    recoverable = true;
  }

  const appError = createAppError(error, type, recoverable);

  logger.error(`API Error on ${endpoint}`, error, {
    type,
    recoverable,
    endpoint,
  });

  return appError;
}

export default logger;
