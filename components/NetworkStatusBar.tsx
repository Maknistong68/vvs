// Network Status Bar Component
// Shows a banner when network is offline, and a brief success state on reconnection (W23)

import React, { memo, useEffect, useState, useRef } from 'react';
import { View, StyleSheet, Animated, Text, TouchableOpacity } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { colors } from '../lib/theme';
import { useNetworkStatus } from '../lib/hooks';

interface NetworkStatusBarProps {
  onRetry?: () => void;
}

function NetworkStatusBar({ onRetry }: NetworkStatusBarProps) {
  const { isConnected, isChecking, refresh } = useNetworkStatus();
  const insets = useSafeAreaInsets();
  const [visible, setVisible] = useState(false);
  const [showReconnected, setShowReconnected] = useState(false);
  const slideAnim = useState(new Animated.Value(-50))[0];
  const wasDisconnectedRef = useRef(false);

  useEffect(() => {
    if (!isConnected) {
      wasDisconnectedRef.current = true;
      setShowReconnected(false);
      setVisible(true);
      Animated.timing(slideAnim, {
        toValue: 0,
        duration: 200,
        useNativeDriver: true,
      }).start();
    } else if (wasDisconnectedRef.current) {
      // Was disconnected, now reconnected - show success briefly
      wasDisconnectedRef.current = false;
      setShowReconnected(true);
      Animated.timing(slideAnim, {
        toValue: 0,
        duration: 200,
        useNativeDriver: true,
      }).start();
      // Auto-dismiss after 2 seconds
      const timer = setTimeout(() => {
        Animated.timing(slideAnim, {
          toValue: -50,
          duration: 200,
          useNativeDriver: true,
        }).start(() => {
          setVisible(false);
          setShowReconnected(false);
        });
      }, 2000);
      return () => clearTimeout(timer);
    } else if (visible && !showReconnected) {
      Animated.timing(slideAnim, {
        toValue: -50,
        duration: 200,
        useNativeDriver: true,
      }).start(() => setVisible(false));
    }
  }, [isConnected, slideAnim, visible, showReconnected]);

  if (!visible && isConnected) return null;

  const handleRetry = () => {
    refresh();
    onRetry?.();
  };

  const bgColor = showReconnected ? colors.success : colors.error;
  const message = showReconnected
    ? 'Back online'
    : isChecking
    ? 'Checking connection...'
    : 'No internet connection';
  const iconName = showReconnected
    ? 'wifi-check'
    : isChecking
    ? 'loading'
    : 'wifi-off';

  return (
    <Animated.View
      style={[
        styles.container,
        {
          top: insets.top + 4,
          backgroundColor: bgColor,
          transform: [{ translateY: slideAnim }],
        },
      ]}
      accessibilityRole="alert"
      accessibilityLiveRegion="polite"
    >
      <View style={styles.content}>
        <MaterialCommunityIcons
          name={iconName}
          size={14}
          color={colors.white}
        />
        <Text style={styles.text}>{message}</Text>
        {!isChecking && !showReconnected && (
          <TouchableOpacity
            onPress={handleRetry}
            style={styles.retryButton}
            accessibilityRole="button"
            accessibilityLabel="Retry connection"
          >
            <Text style={styles.retryText}>Retry</Text>
          </TouchableOpacity>
        )}
      </View>
    </Animated.View>
  );
}

const styles = StyleSheet.create({
  container: {
    position: 'absolute',
    left: 16,
    right: 16,
    zIndex: 1000,
    borderRadius: 8,
    paddingVertical: 8,
    paddingHorizontal: 12,
  },
  content: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 6,
  },
  text: {
    color: colors.white,
    fontSize: 12,
    fontWeight: '600',
  },
  retryButton: {
    backgroundColor: 'rgba(255,255,255,0.2)',
    paddingHorizontal: 10,
    paddingVertical: 3,
    borderRadius: 10,
    marginLeft: 6,
  },
  retryText: {
    color: colors.white,
    fontSize: 11,
    fontWeight: '600',
  },
});

export default memo(NetworkStatusBar);
