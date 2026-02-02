import { Tabs } from 'expo-router';
import { useAuth, useIsAdmin, useIsContractor } from '../../lib/auth';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { colors, glass } from '../../lib/theme';
import { View, Platform } from 'react-native';

export default function TabsLayout() {
  const { loading: authLoading } = useAuth();
  const { isAdmin, loading: adminLoading } = useIsAdmin();
  const { isContractor, loading: contractorLoading } = useIsContractor();

  // Wait for all role checks to complete
  const loading = authLoading || adminLoading || contractorLoading;

  // Hide admin tab while loading OR if user is not admin
  const showAdminTab = !loading && isAdmin;

  // Hide inspect tab from contractors
  const showInspectTab = !loading && !isContractor;

  return (
    <View style={{ flex: 1, backgroundColor: colors.background }}>
      <Tabs
        screenOptions={{
          headerShown: false,
          tabBarActiveTintColor: colors.primary,
          tabBarInactiveTintColor: colors.textMuted,
          tabBarStyle: {
            position: 'absolute',
            backgroundColor: 'rgba(15, 23, 42, 0.9)',
            borderTopWidth: 1,
            borderTopColor: glass.border.color,
            paddingBottom: Platform.OS === 'ios' ? 24 : 8,
            paddingTop: 8,
            height: Platform.OS === 'ios' ? 85 : 65,
            ...Platform.select({
              ios: {
                shadowColor: '#000',
                shadowOffset: { width: 0, height: -4 },
                shadowOpacity: 0.15,
                shadowRadius: 8,
              },
              android: {
                elevation: 8,
              },
            }),
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
            tabBarAccessibilityLabel: 'Home Dashboard',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="view-dashboard" color={color} size={size} />
            ),
          }}
        />
        <Tabs.Screen
          name="inspections"
          options={{
            tabBarLabel: 'Inspect',
            tabBarAccessibilityLabel: 'Vehicle Inspections',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="clipboard-check" color={color} size={size} />
            ),
            href: showInspectTab ? undefined : null,
          }}
        />
        <Tabs.Screen
          name="admin"
          options={{
            tabBarLabel: 'Manage',
            tabBarAccessibilityLabel: 'Admin Management',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="cog" color={color} size={size} />
            ),
            href: showAdminTab ? undefined : null,
          }}
        />
        <Tabs.Screen
          name="settings"
          options={{
            tabBarLabel: 'Profile',
            tabBarAccessibilityLabel: 'User Profile Settings',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="account-circle" color={color} size={size} />
            ),
          }}
        />
      </Tabs>
    </View>
  );
}
