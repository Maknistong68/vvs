import React from 'react';
import { View, StyleSheet, Platform } from 'react-native';
import { Text } from 'react-native-paper';
import { LinearGradient } from 'expo-linear-gradient';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { colors, glass } from '../lib/theme';

interface StatCardProps {
  title: string;
  value: number | string;
  icon: string;
  color: string;
  gradient?: string[];
}

export default function StatCard({ title, value, icon, color, gradient }: StatCardProps) {
  const cardGradient = gradient || [`${color}15`, `${color}05`];

  return (
    <View style={styles.container}>
      <LinearGradient
        colors={['rgba(30, 41, 59, 0.6)', 'rgba(30, 41, 59, 0.4)']}
        style={styles.baseGradient}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 1 }}
      />
      <LinearGradient
        colors={cardGradient as [string, string]}
        style={styles.colorGradient}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 1 }}
      />
      <View style={styles.content}>
        <View style={[styles.iconWrap, { backgroundColor: `${color}20` }]}>
          <View style={[styles.iconGlow, { backgroundColor: `${color}30` }]} />
          <MaterialCommunityIcons name={icon} size={24} color={color} />
        </View>
        <Text style={[styles.value, { color }]}>{value}</Text>
        <Text style={styles.title}>{title}</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    margin: 6,
    minHeight: 110,
    borderRadius: glass.border.radius.md,
    borderWidth: glass.border.width,
    borderColor: glass.border.color,
    overflow: 'hidden',
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
  baseGradient: {
    ...StyleSheet.absoluteFillObject,
  },
  colorGradient: {
    ...StyleSheet.absoluteFillObject,
  },
  content: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 14,
  },
  iconWrap: {
    width: 48,
    height: 48,
    borderRadius: 24,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 8,
    position: 'relative',
  },
  iconGlow: {
    ...StyleSheet.absoluteFillObject,
    borderRadius: 24,
    transform: [{ scale: 1.2 }],
    opacity: 0.5,
  },
  value: {
    fontSize: 28,
    fontWeight: 'bold',
  },
  title: {
    color: colors.textSecondary,
    fontSize: 12,
    marginTop: 2,
    fontWeight: '500',
  },
});
