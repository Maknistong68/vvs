// Network Status Bar Component
// Shows a banner when network is offline

import React, { memo, useEffect, useState } from 'react';
import { View, StyleSheet, Animated, Text, TouchableOpacity } from 'react-native';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { colors } from '../lib/theme';
import { useNetworkStatus } from '../lib/hooks';

interface NetworkStatusBarProps {
  onRetry?: () => void;
}

function NetworkStatusBar({ onRetry }: NetworkStatusBarProps) {
  const { isConnected, isChecking, refresh } = useNetworkStatus();
  const [visible, setVisible] = useState(false);
  const slideAnim = useState(new Animated.Value(-60))[0];

  useEffect(() => {
    if (!isConnected) {
      setVisible(true);
      Animated.spring(slideAnim, {
        toValue: 0,
        useNativeDriver: true,
        tension: 50,
        friction: 8,
      }).start();
    } else if (visible) {
      Animated.timing(slideAnim, {
        toValue: -60,
        duration: 300,
        useNativeDriver: true,
      }).start(() => setVisible(false));
    }
  }, [isConnected, slideAnim, visible]);

  if (!visible && isConnected) return null;

  const handleRetry = () => {
    refresh();
    onRetry?.();
  };

  return (
    <Animated.View
      style={[
        styles.container,
        { transform: [{ translateY: slideAnim }] },
      ]}
      accessibilityRole="alert"
      accessibilityLiveRegion="polite"
    >
      <View style={styles.content}>
        <MaterialCommunityIcons
          name={isChecking ? 'loading' : 'wifi-off'}
          size={20}
          color={colors.white}
          style={isChecking ? styles.spinning : undefined}
        />
        <Text style={styles.text}>
          {isChecking ? 'Checking connection...' : 'No internet connection'}
        </Text>
        {!isChecking && (
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
    top: 0,
    left: 0,
    right: 0,
    zIndex: 1000,
    backgroundColor: colors.error,
    paddingTop: 50, // Account for status bar
    paddingBottom: 12,
    paddingHorizontal: 16,
  },
  content: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
  },
  text: {
    color: colors.white,
    fontSize: 14,
    fontWeight: '600',
  },
  retryButton: {
    backgroundColor: 'rgba(255, 255, 255, 0.2)',
    paddingHorizontal: 12,
    paddingVertical: 4,
    borderRadius: 12,
    marginLeft: 8,
  },
  retryText: {
    color: colors.white,
    fontSize: 12,
    fontWeight: '600',
  },
  spinning: {
    // Note: Actual spinning animation would require Animated API
  },
});

export default memo(NetworkStatusBar);
