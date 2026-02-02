import React, { Component, ErrorInfo, ReactNode } from 'react';
import { View, StyleSheet, ScrollView } from 'react-native';
import { Text, Button } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { colors, glass } from '../lib/theme';
import { logErrorBoundary } from '../lib/logger';

interface Props {
  children: ReactNode;
  fallback?: ReactNode;
  onError?: (error: Error, errorInfo: ErrorInfo) => void;
}

interface State {
  hasError: boolean;
  error: Error | null;
  errorInfo: ErrorInfo | null;
}

export default class ErrorBoundary extends Component<Props, State> {
  constructor(props: Props) {
    super(props);
    this.state = { hasError: false, error: null, errorInfo: null };
  }

  static getDerivedStateFromError(error: Error): Partial<State> {
    return { hasError: true, error };
  }

  componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    // Log error to our logging system
    logErrorBoundary(error, errorInfo.componentStack || 'No component stack');

    // Store error info for display
    this.setState({ errorInfo });

    // Call optional error callback
    this.props.onError?.(error, errorInfo);
  }

  handleRetry = () => {
    this.setState({ hasError: false, error: null, errorInfo: null });
  };

  render() {
    if (this.state.hasError) {
      if (this.props.fallback) {
        return this.props.fallback;
      }

      const { error } = this.state;
      const showDetails = __DEV__ && error;

      return (
        <View style={styles.container}>
          <ScrollView contentContainerStyle={styles.scrollContent}>
            <View style={styles.content}>
              <MaterialCommunityIcons
                name="alert-circle-outline"
                size={64}
                color={colors.error}
                accessibilityLabel="Error icon"
              />
              <Text style={styles.title}>Something went wrong</Text>
              <Text style={styles.message}>
                An unexpected error occurred. Please try again.
              </Text>

              {showDetails && (
                <View style={styles.errorDetails}>
                  <Text style={styles.errorName}>{error.name}</Text>
                  <Text style={styles.errorMessage}>{error.message}</Text>
                </View>
              )}

              <Button
                mode="contained"
                onPress={this.handleRetry}
                style={styles.button}
                buttonColor={colors.primary}
                accessibilityLabel="Try again button"
                accessibilityHint="Attempts to recover from the error"
              >
                Try Again
              </Button>
            </View>
          </ScrollView>
        </View>
      );
    }

    return this.props.children;
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
  },
  scrollContent: {
    flexGrow: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  content: {
    alignItems: 'center',
    backgroundColor: glass.background.card,
    borderRadius: glass.border.radius.lg,
    borderWidth: glass.border.width,
    borderColor: glass.border.color,
    padding: 32,
    maxWidth: 320,
  },
  title: {
    color: colors.textPrimary,
    fontSize: 20,
    fontWeight: 'bold',
    marginTop: 16,
    marginBottom: 8,
    textAlign: 'center',
  },
  message: {
    color: colors.textSecondary,
    fontSize: 14,
    textAlign: 'center',
    marginBottom: 24,
  },
  errorDetails: {
    backgroundColor: 'rgba(239, 68, 68, 0.1)',
    borderRadius: glass.border.radius.sm,
    padding: 12,
    marginBottom: 16,
    width: '100%',
  },
  errorName: {
    color: colors.error,
    fontSize: 12,
    fontWeight: 'bold',
    marginBottom: 4,
  },
  errorMessage: {
    color: colors.textSecondary,
    fontSize: 11,
    fontFamily: 'monospace',
  },
  button: {
    borderRadius: glass.border.radius.md,
    minWidth: 120,
  },
});
