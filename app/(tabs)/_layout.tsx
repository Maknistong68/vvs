import { Tabs } from 'expo-router';
import { useIsAdmin } from '../../lib/auth';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { colors } from '../../lib/theme';
import { View } from 'react-native';

export default function TabsLayout() {
  const isAdmin = useIsAdmin();

  return (
    <View style={{ flex: 1, backgroundColor: colors.background }}>
      <Tabs
        screenOptions={{
          headerShown: false, // Hide header - screens have their own titles
          tabBarActiveTintColor: colors.primary,
          tabBarInactiveTintColor: colors.textMuted,
          tabBarStyle: {
            backgroundColor: colors.card,
            borderTopWidth: 1,
            borderTopColor: colors.cardBorder,
            paddingBottom: 8,
            paddingTop: 8,
            height: 65,
          },
          tabBarLabelStyle: {
            fontSize: 11,
            fontWeight: '600',
          },
          sceneStyle: {
            backgroundColor: colors.background,
          },
        }}
      >
        <Tabs.Screen
          name="index"
          options={{
            tabBarLabel: 'Home',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="view-dashboard" color={color} size={size} />
            ),
          }}
        />
        <Tabs.Screen
          name="inspections"
          options={{
            tabBarLabel: 'Inspect',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="clipboard-check" color={color} size={size} />
            ),
          }}
        />
        <Tabs.Screen
          name="certificates"
          options={{
            tabBarLabel: 'Certs',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="certificate" color={color} size={size} />
            ),
          }}
        />
        <Tabs.Screen
          name="admin"
          options={{
            tabBarLabel: 'Manage',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="cog" color={color} size={size} />
            ),
            href: isAdmin ? undefined : null,
          }}
        />
        <Tabs.Screen
          name="settings"
          options={{
            tabBarLabel: 'Profile',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="account-circle" color={color} size={size} />
            ),
          }}
        />
      </Tabs>
    </View>
  );
}
