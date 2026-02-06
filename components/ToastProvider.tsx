import React, { createContext, useContext, useState, useCallback, useRef, memo, useEffect } from 'react';
import { View, StyleSheet, Animated, TouchableOpacity } from 'react-native';
import { Text } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { colors, glass } from '../lib/theme';
import { hapticSuccess, hapticError, hapticLight } from '../lib/haptics';

type ToastType = 'success' | 'error' | 'info';

interface Toast {
  id: number;
  type: ToastType;
  message: string;
}

interface ToastContextType {
  showSuccess: (message: string) => void;
  showError: (message: string) => void;
  showInfo: (message: string) => void;
}

const ToastContext = createContext<ToastContextType | undefined>(undefined);

const ICON_MAP: Record<ToastType, string> = {
  success: 'check-circle',
  error: 'alert-circle',
  info: 'information',
};

const COLOR_MAP: Record<ToastType, string> = {
  success: colors.success,
  error: colors.error,
  info: colors.primary,
};

const DURATION_MAP: Record<ToastType, number> = {
  success: 3000,
  error: 5000,
  info: 3000,
};

const ANIMATION_DURATION = 300;

interface ToastItemProps {
  toast: Toast;
  onDismiss: (id: number) => void;
}

const ToastItem = memo(function ToastItem({ toast, onDismiss }: ToastItemProps) {
  const translateY = useRef(new Animated.Value(100)).current;
  const opacity = useRef(new Animated.Value(0)).current;
  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => {
    // Slide in
    Animated.parallel([
      Animated.timing(translateY, {
        toValue: 0,
        duration: ANIMATION_DURATION,
        useNativeDriver: true,
      }),
      Animated.timing(opacity, {
        toValue: 1,
        duration: ANIMATION_DURATION,
        useNativeDriver: true,
      }),
    ]).start();

    // Auto-dismiss after duration
    timerRef.current = setTimeout(() => {
      dismissToast();
    }, DURATION_MAP[toast.type]);

    return () => {
      if (timerRef.current) {
        clearTimeout(timerRef.current);
      }
    };
  }, []);

  const dismissToast = useCallback(() => {
    if (timerRef.current) {
      clearTimeout(timerRef.current);
      timerRef.current = null;
    }

    // Slide out
    Animated.parallel([
      Animated.timing(translateY, {
        toValue: 100,
        duration: ANIMATION_DURATION,
        useNativeDriver: true,
      }),
      Animated.timing(opacity, {
        toValue: 0,
        duration: ANIMATION_DURATION,
        useNativeDriver: true,
      }),
    ]).start(() => {
      onDismiss(toast.id);
    });
  }, [onDismiss, toast.id, translateY, opacity]);

  const accentColor = COLOR_MAP[toast.type];
  const iconName = ICON_MAP[toast.type];

  return (
    <Animated.View
      style={[
        styles.toastContainer,
        {
          transform: [{ translateY }],
          opacity,
        },
      ]}
      accessibilityRole="alert"
      accessibilityLiveRegion="polite"
    >
      <View style={[styles.toastContent, { borderLeftColor: accentColor }]}>
        <MaterialCommunityIcons name={iconName} size={22} color={accentColor} />
        <Text style={styles.toastText} numberOfLines={3}>
          {toast.message}
        </Text>
        <TouchableOpacity
          onPress={dismissToast}
          hitSlop={{ top: 10, bottom: 10, left: 10, right: 10 }}
          accessibilityRole="button"
          accessibilityLabel="Dismiss notification"
        >
          <MaterialCommunityIcons name="close" size={20} color={colors.textMuted} />
        </TouchableOpacity>
      </View>
    </Animated.View>
  );
});

function ToastProvider({ children }: { children: React.ReactNode }) {
  const [currentToast, setCurrentToast] = useState<Toast | null>(null);
  const [queue, setQueue] = useState<Toast[]>([]);
  const idCounter = useRef(0);
  const isShowingRef = useRef(false);

  const processQueue = useCallback(() => {
    setQueue((prevQueue) => {
      if (prevQueue.length === 0) {
        isShowingRef.current = false;
        return prevQueue;
      }
      // Show the latest toast from the queue (last item)
      const latest = prevQueue[prevQueue.length - 1];
      setCurrentToast(latest);
      isShowingRef.current = true;
      // Clear the queue since we only show the latest
      return [];
    });
  }, []);

  const enqueueToast = useCallback((type: ToastType, message: string) => {
    const id = ++idCounter.current;
    const newToast: Toast = { id, type, message };

    if (!isShowingRef.current) {
      // No toast currently showing, display immediately
      setCurrentToast(newToast);
      isShowingRef.current = true;
    } else {
      // Replace any queued toasts with the latest one
      setQueue([newToast]);
    }
  }, []);

  const handleDismiss = useCallback((id: number) => {
    setCurrentToast((prev) => {
      if (prev && prev.id === id) {
        // After removing current toast, process queue on next tick
        setTimeout(() => processQueue(), 50);
        return null;
      }
      return prev;
    });
  }, [processQueue]);

  const showSuccess = useCallback((message: string) => {
    hapticSuccess();
    enqueueToast('success', message);
  }, [enqueueToast]);

  const showError = useCallback((message: string) => {
    hapticError();
    enqueueToast('error', message);
  }, [enqueueToast]);

  const showInfo = useCallback((message: string) => {
    hapticLight();
    enqueueToast('info', message);
  }, [enqueueToast]);

  const contextValue: ToastContextType = React.useMemo(
    () => ({ showSuccess, showError, showInfo }),
    [showSuccess, showError, showInfo],
  );

  return (
    <ToastContext.Provider value={contextValue}>
      {children}
      {currentToast && (
        <ToastItem
          key={currentToast.id}
          toast={currentToast}
          onDismiss={handleDismiss}
        />
      )}
    </ToastContext.Provider>
  );
}

export function useToast(): ToastContextType {
  const context = useContext(ToastContext);
  if (!context) {
    throw new Error('useToast must be used within a ToastProvider');
  }
  return context;
}

const styles = StyleSheet.create({
  toastContainer: {
    position: 'absolute',
    bottom: 100,
    left: 16,
    right: 16,
    zIndex: 9999,
  },
  toastContent: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.cardSolid,
    paddingHorizontal: 16,
    paddingVertical: 14,
    borderRadius: glass.border.radius.md,
    borderLeftWidth: 4,
    gap: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 8,
  },
  toastText: {
    flex: 1,
    color: colors.white,
    fontSize: 14,
    fontWeight: '500',
    lineHeight: 20,
  },
});

export default ToastProvider;
