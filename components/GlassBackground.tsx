import React from 'react';
import { View, StyleSheet, Dimensions } from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, glass } from '../lib/theme';

const { width, height } = Dimensions.get('window');

interface GlassBackgroundProps {
  children: React.ReactNode;
}

export default function GlassBackground({ children }: GlassBackgroundProps) {
  return (
    <View style={styles.container}>
      <LinearGradient
        colors={['#0F172A', '#1E293B']}
        style={styles.gradient}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 1 }}
      />

      {/* Decorative orbs */}
      <View style={[styles.orb, styles.orbPrimary]} />
      <View style={[styles.orb, styles.orbSecondary]} />
      <View style={[styles.orb, styles.orbAccent]} />

      {/* Content */}
      <View style={styles.content}>
        {children}
      </View>
    </View>
  );
}

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
