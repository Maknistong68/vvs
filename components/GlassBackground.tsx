import React, { memo } from 'react';
import { View, StyleSheet, Dimensions } from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, glass, gradients } from '../lib/theme';

const { width, height } = Dimensions.get('window');

interface GlassBackgroundProps {
  children: React.ReactNode;
  testID?: string;
}

function GlassBackground({ children, testID }: GlassBackgroundProps) {
  return (
    <View style={styles.container} testID={testID}>
      <LinearGradient
        colors={gradients.background as [string, string]}
        style={styles.gradient}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 1 }}
      />

      {/* Decorative orbs - hidden from accessibility tree */}
      <View style={[styles.orb, styles.orbPrimary]} accessibilityElementsHidden importantForAccessibility="no-hide-descendants" />
      <View style={[styles.orb, styles.orbSecondary]} accessibilityElementsHidden importantForAccessibility="no-hide-descendants" />
      <View style={[styles.orb, styles.orbAccent]} accessibilityElementsHidden importantForAccessibility="no-hide-descendants" />

      {/* Content */}
      <View style={styles.content}>
        {children}
      </View>
    </View>
  );
}

// Memoize - only re-render when children change
export default memo(GlassBackground);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  gradient: {
    ...StyleSheet.absoluteFillObject,
  },
  orb: {
    position: 'absolute',
    borderRadius: 9999,
  },
  orbPrimary: {
    top: -height * 0.15,
    right: -width * 0.2,
    width: width * 0.8,
    height: width * 0.8,
    backgroundColor: glass.orbs.primary,
  },
  orbSecondary: {
    bottom: -height * 0.1,
    left: -width * 0.3,
    width: width * 0.7,
    height: width * 0.7,
    backgroundColor: glass.orbs.secondary,
  },
  orbAccent: {
    top: height * 0.4,
    right: -width * 0.15,
    width: width * 0.5,
    height: width * 0.5,
    backgroundColor: glass.orbs.accent,
  },
  content: {
    flex: 1,
  },
});
