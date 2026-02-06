import React, { memo } from 'react';
import { View, StyleSheet, ViewStyle } from 'react-native';
import { Text, Button } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { colors, glass } from '../lib/theme';
import GlassCard from './GlassCard';

interface EmptyStateProps {
  icon: string;
  title: string;
  subtitle?: string;
  actionLabel?: string;
  onAction?: () => void;
  style?: ViewStyle;
}

function EmptyState({ icon, title, subtitle, actionLabel, onAction, style }: EmptyStateProps) {
  return (
    <GlassCard style={{ ...styles.container, ...style }} padding={32}>
      <MaterialCommunityIcons name={icon as any} size={48} color={colors.textMuted} />
      <Text style={styles.title}>{title}</Text>
      {subtitle && <Text style={styles.subtitle}>{subtitle}</Text>}
      {actionLabel && onAction && (
        <Button
          mode="contained"
          onPress={onAction}
          style={styles.action}
          buttonColor={colors.primary}
          accessibilityLabel={actionLabel}
        >
          {actionLabel}
        </Button>
      )}
    </GlassCard>
  );
}

export default memo(EmptyState);

const styles = StyleSheet.create({
  container: {
    alignItems: 'center',
    margin: 16,
  },
  title: {
    color: colors.textPrimary,
    fontSize: 16,
    fontWeight: '600',
    marginTop: 12,
    textAlign: 'center',
  },
  subtitle: {
    color: colors.textMuted,
    fontSize: 13,
    marginTop: 4,
    textAlign: 'center',
  },
  action: {
    marginTop: 16,
    borderRadius: glass.border.radius.md,
  },
});
