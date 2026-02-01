import React from 'react';
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
    gradient: ['rgba(139, 92, 246, 0.15)', 'rgba(59, 130, 246, 0.1)'],
    border: 'rgba(139, 92, 246, 0.3)',
  },
  success: {
    gradient: ['rgba(34, 197, 94, 0.15)', 'rgba(34, 197, 94, 0.05)'],
    border: 'rgba(34, 197, 94, 0.3)',
  },
  error: {
    gradient: ['rgba(239, 68, 68, 0.15)', 'rgba(239, 68, 68, 0.05)'],
    border: 'rgba(239, 68, 68, 0.3)',
  },
  warning: {
    gradient: ['rgba(245, 158, 11, 0.15)', 'rgba(245, 158, 11, 0.05)'],
    border: 'rgba(245, 158, 11, 0.3)',
  },
};

export default function GlassCard({
  children,
  style,
  elevated = false,
  variant = 'default',
  onPress,
  padding = 16,
}: GlassCardProps) {
  const activeVariant = elevated ? 'elevated' : variant;
  const variantConfig = variantColors[activeVariant];
  const borderRadius = elevated ? glass.border.radius.lg : glass.border.radius.md;

  const cardContent = (
    <View style={[styles.container, { borderRadius, borderColor: variantConfig.border }, style]}>
      <LinearGradient
        colors={variantConfig.gradient as [string, string]}
        style={[styles.gradient, { borderRadius }]}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 1 }}
      />
      <View style={[styles.content, { padding }]}>
        {children}
      </View>
    </View>
  );

  if (onPress) {
    return (
      <Pressable
        onPress={onPress}
        style={({ pressed }) => [pressed && styles.pressed]}
      >
        {cardContent}
      </Pressable>
    );
  }

  return cardContent;
}

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
