import { Tabs } from 'expo-router';
import { useAuth, useIsAdmin } from '../../lib/auth';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';

export default function TabsLayout() {
  const { user } = useAuth();
  const isAdmin = useIsAdmin();

  return (
    <Tabs
      screenOptions={{
        tabBarActiveTintColor: '#6200EE',
        tabBarInactiveTintColor: '#666',
        tabBarStyle: {
          backgroundColor: '#FFFFFF',
          borderTopWidth: 1,
          borderTopColor: '#e0e0e0',
          paddingBottom: 5,
          paddingTop: 5,
          height: 60,
        },
        headerStyle: {
          backgroundColor: '#6200EE',
        },
        headerTintColor: '#FFFFFF',
        headerTitleStyle: {
          fontWeight: 'bold',
        },
      }}
    >
      <Tabs.Screen
        name="index"
        options={{
          title: 'Dashboard',
          tabBarLabel: 'Dashboard',
          tabBarIcon: ({ color, size }) => (
            <MaterialCommunityIcons name="view-dashboard" color={color} size={size} />
          ),
        }}
      />
      <Tabs.Screen
        name="inspections"
        options={{
          title: 'Inspections',
          tabBarLabel: 'Inspections',
          tabBarIcon: ({ color, size }) => (
            <MaterialCommunityIcons name="clipboard-check" color={color} size={size} />
          ),
        }}
      />
      <Tabs.Screen
        name="admin"
        options={{
          title: 'Admin Panel',
          tabBarLabel: 'Admin',
          tabBarIcon: ({ color, size }) => (
            <MaterialCommunityIcons name="shield-account" color={color} size={size} />
          ),
          href: isAdmin ? undefined : null, // Hide if not admin
        }}
      />
      <Tabs.Screen
        name="settings"
        options={{
          title: 'Settings',
          tabBarLabel: 'Settings',
          tabBarIcon: ({ color, size }) => (
            <MaterialCommunityIcons name="cog" color={color} size={size} />
          ),
        }}
      />
    </Tabs>
  );
}
