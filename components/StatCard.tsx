import React from 'react';
import { View, StyleSheet } from 'react-native';
import { Card, Text } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';

interface StatCardProps {
  title: string;
  value: number | string;
  icon: string;
  color: string;
}

export default function StatCard({ title, value, icon, color }: StatCardProps) {
  return (
    <Card style={styles.card}>
      <Card.Content style={styles.content}>
        <View style={[styles.iconContainer, { backgroundColor: `${color}20` }]}>
          <MaterialCommunityIcons name={icon} size={24} color={color} />
        </View>
        <Text variant="titleLarge" style={[styles.value, { color }]}>
          {value}
        </Text>
        <Text variant="bodySmall" style={styles.title}>
          {title}
        </Text>
      </Card.Content>
    </Card>
  );
}

const styles = StyleSheet.create({
  card: {
    flex: 1,
    margin: 4,
    backgroundColor: '#FFFFFF',
  },
  content: {
    alignItems: 'center',
    paddingVertical: 12,
  },
  iconContainer: {
    width: 48,
    height: 48,
    borderRadius: 24,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 8,
  },
  value: {
    fontWeight: 'bold',
    fontSize: 24,
  },
  title: {
    color: '#666',
    marginTop: 4,
  },
});
