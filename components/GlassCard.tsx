import React, { memo, useMemo } from 'react';
import { View, StyleSheet, ViewStyle, Pressable, Platform } from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, glass } from '../lib/theme';

type CardVariant = 'default' | 'elevated' | 'accent' | 'success' | 'error' | 'warning';

interface GlassCardProps {
  children: React.ReactNode;
  style?: ViewStyle;
  elevated?: boolean;
  variant?: CardVariant;
  onPress?: () => void;
  padding?: number;
  accessibilityLabel?: string;
  accessibilityHint?: string;
  accessibilityRole?: 'button' | 'none' | 'link' | 'tab';
  testID?: string;
}

const variantColors: Record<CardVariant, { gradient: string[]; border: string }> = {
  default: {
    gradient: ['rgba(30, 41, 59, 0.6)', 'rgba(30, 41, 59, 0.4)'],
    border: glass.border.color,
  },
  elevated: {
    gradient: ['rgba(51, 65, 85, 0.7)', 'rgba(51, 65, 85, 0.5)'],
    border: glass.border.colorLight,
  },
  accent: {
    gradient: [`${colors.accent}15`, `${colors.primary}10`],
    border: `${colors.accent}30`,
  },
  success: {
    gradient: [`${colors.success}15`, `${colors.success}05`],
    border: `${colors.success}30`,
  },
  error: {
    gradient: [`${colors.error}15`, `${colors.error}05`],
    border: `${colors.error}30`,
  },
  warning: {
    gradient: [`${colors.warning}15`, `${colors.warning}05`],
    border: `${colors.warning}30`,
  },
};

function GlassCard({
  children,
  style,
  elevated = false,
  variant = 'default',
  onPress,
  padding = 16,
  accessibilityLabel,
  accessibilityHint,
  accessibilityRole,
  testID,
}: GlassCardProps) {
  const activeVariant = elevated ? 'elevated' : variant;
  const variantConfig = variantColors[activeVariant];
  const borderRadius = elevated ? glass.border.radius.lg : glass.border.radius.md;

  // Memoize computed styles
  const containerStyle = useMemo(
    () => [styles.container, { borderRadius, borderColor: variantConfig.border }, style],
    [borderRadius, variantConfig.border, style]
  );

  const gradientStyle = useMemo(
    () => [styles.gradient, { borderRadius }],
    [borderRadius]
  );

  const contentStyle = useMemo(
    () => [styles.content, { padding }],
    [padding]
  );

  const cardContent = (
    <View style={containerStyle} testID={testID}>
      <LinearGradient
        colors={variantConfig.gradient as [string, string]}
        style={gradientStyle}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 1 }}
      />
      <View style={contentStyle}>
        {children}
      </View>
    </View>
  );

  if (onPress) {
    return (
      <Pressable
        onPress={onPress}
        style={({ pressed }) => [pressed && styles.pressed]}
        accessible={true}
        accessibilityRole={accessibilityRole || 'button'}
        accessibilityLabel={accessibilityLabel}
        accessibilityHint={accessibilityHint}
      >
        {cardContent}
      </Pressable>
    );
  }

  return cardContent;
}

// Memoize component to prevent unnecessary re-renders
export default memo(GlassCard);

const styles = StyleSheet.create({
  container: {
    overflow: 'hidden',
    borderWidth: glass.border.width,
    margin: 6,
    ...Platform.select({
      ios: {
        shadowColor: glass.shadow.color,
        shadowOffset: { width: 0, height: 4 },
        shadowOpacity: 0.3,
        shadowRadius: 8,
      },
      android: {
        elevation: 4,
      },
    }),
  },
  gradient: {
    ...StyleSheet.absoluteFillObject,
  },
  content: {
    position: 'relative',
  },
  pressed: {
    opacity: 0.85,
    transform: [{ scale: 0.98 }],
  },
});
