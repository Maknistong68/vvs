import { useEffect } from 'react';
import { Stack, useRouter, useSegments } from 'expo-router';
import { PaperProvider } from 'react-native-paper';
import { AuthProvider, useAuth } from '../lib/auth';
import { QueryProvider } from '../lib/queryClient';
import { View, ActivityIndicator, StyleSheet, Text } from 'react-native';
import { paperTheme, colors } from '../lib/theme';
import ErrorBoundary from '../components/ErrorBoundary';
import NetworkStatusBar from '../components/NetworkStatusBar';
import { setupGlobalErrorHandlers, logger } from '../lib/logger';

function RootLayoutNav() {
  const { session, loading } = useAuth();
  const segments = useSegments();
  const router = useRouter();

  useEffect(() => {
    if (loading) return;
    const inAuthGroup = segments[0] === '(auth)';
    if (!session && !inAuthGroup) router.replace('/(auth)/login');
    else if (session && inAuthGroup) router.replace('/(tabs)');
  }, [session, loading, segments, router]);

  if (loading) {
    return (
      <View style={styles.loading}>
        <ActivityIndicator size="large" color={colors.primary} />
        <Text style={styles.loadingText}>Loading...</Text>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <NetworkStatusBar />
      <Stack
        screenOptions={{
          headerShown: false,
          contentStyle: { backgroundColor: colors.background },
          animation: 'slide_from_right',
        }}
      >
        <Stack.Screen name="(auth)" />
        <Stack.Screen name="(tabs)" />
        <Stack.Screen
          name="inspection/[id]"
          options={{
            headerShown: true,
            title: 'Inspection Details',
            presentation: 'modal',
            headerStyle: { backgroundColor: colors.card },
            headerTintColor: colors.textPrimary,
          }}
        />
      </Stack>
    </View>
  );
}

export default function RootLayout() {
  // Initialize global error handlers
  useEffect(() => {
    setupGlobalErrorHandlers();
  }, []);

  return (
    <ErrorBoundary>
      <QueryProvider>
        <PaperProvider theme={paperTheme}>
          <AuthProvider>
            <RootLayoutNav />
          </AuthProvider>
        </PaperProvider>
      </QueryProvider>
    </ErrorBoundary>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  loading: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.background,
  },
  loadingText: {
    color: colors.textMuted,
    marginTop: 12,
    fontSize: 14,
  },
});
