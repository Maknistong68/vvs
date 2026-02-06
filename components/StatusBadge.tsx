import React, { memo } from 'react';
import { View, StyleSheet, ViewStyle } from 'react-native';
import { Text } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { statusColors, colors } from '../lib/theme';

interface StatusBadgeProps {
  status: string;
  label?: string;
  size?: 'small' | 'medium';
  style?: ViewStyle;
}

function StatusBadge({ status, label, size = 'small', style }: StatusBadgeProps) {
  const sc = statusColors[status] || statusColors.pending;
  const displayLabel = label || (status.charAt(0).toUpperCase() + status.slice(1));
  const isSmall = size === 'small';

  return (
    <View
      style={[
        styles.badge,
        { backgroundColor: sc.bg },
        isSmall ? styles.small : styles.medium,
        style,
      ]}
      accessibilityRole="text"
      accessibilityLabel={`Status: ${displayLabel}`}
    >
      <MaterialCommunityIcons
        name={sc.icon}
        size={isSmall ? 12 : 16}
        color={sc.text}
      />
      <Text style={[styles.text, { color: sc.text }, isSmall ? styles.smallText : styles.mediumText]}>
        {displayLabel}
      </Text>
    </View>
  );
}

export default memo(StatusBadge);

const styles = StyleSheet.create({
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 8,
    gap: 4,
  },
  small: {
    paddingHorizontal: 8,
    paddingVertical: 4,
  },
  medium: {
    paddingHorizontal: 12,
    paddingVertical: 6,
  },
  text: {
    fontWeight: '600',
  },
  smallText: {
    fontSize: 10,
  },
  mediumText: {
    fontSize: 12,
  },
});
