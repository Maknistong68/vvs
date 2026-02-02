// Standardized Error Display Component
// Provides consistent error UI across the app

import React, { memo } from 'react';
import { View, StyleSheet, TouchableOpacity } from 'react-native';
import { Text, Button } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { colors, glass } from '../lib/theme';
import { ErrorType, isNetworkError } from '../lib/constants';
import GlassCard from './GlassCard';

interface ErrorDisplayProps {
  error: Error | string | null;
  title?: string;
  onRetry?: () => void;
  retryLabel?: string;
  compact?: boolean;
  type?: ErrorType;
}

const errorConfig: Record<ErrorType, { icon: string; color: string; title: string; suggestion: string }> = {
  network: {
    icon: 'wifi-off',
    color: colors.warning,
    title: 'Connection Error',
    suggestion: 'Please check your internet connection and try again.',
  },
  auth: {
    icon: 'account-lock',
    color: colors.error,
    title: 'Authentication Error',
    suggestion: 'Please sign in again to continue.',
  },
  permission: {
    icon: 'lock',
    color: colors.error,
    title: 'Access Denied',
    suggestion: "You don't have permission to perform this action.",
  },
  validation: {
    icon: 'alert-circle',
    color: colors.warning,
    title: 'Validation Error',
    suggestion: 'Please check your input and try again.',
  },
  server: {
    icon: 'server-off',
    color: colors.error,
    title: 'Server Error',
    suggestion: 'Something went wrong on our end. Please try again later.',
  },
  unknown: {
    icon: 'alert-octagon',
    color: colors.error,
    title: 'Something Went Wrong',
    suggestion: 'An unexpected error occurred. Please try again.',
  },
};

function getErrorType(error: Error | string | null): ErrorType {
  if (!error) return 'unknown';

  const message = typeof error === 'string' ? error : error.message;

  if (isNetworkError(error)) return 'network';
  if (message.toLowerCase().includes('unauthorized') || message.includes('401')) return 'auth';
  if (message.toLowerCase().includes('forbidden') || message.includes('403')) return 'permission';
  if (message.toLowerCase().includes('validation') || message.toLowerCase().includes('invalid')) return 'validation';
  if (message.includes('500') || message.toLowerCase().includes('server')) return 'server';

  return 'unknown';
}

function ErrorDisplay({
  error,
  title,
  onRetry,
  retryLabel = 'Try Again',
  compact = false,
  type,
}: ErrorDisplayProps) {
  if (!error) return null;

  const errorType = type || getErrorType(error);
  const config = errorConfig[errorType];
  const errorMessage = typeof error === 'string' ? error : error.message;

  if (compact) {
    return (
      <TouchableOpacity
        onPress={onRetry}
        style={styles.compactContainer}
        disabled={!onRetry}
        accessibilityRole={onRetry ? 'button' : 'alert'}
        accessibilityLabel={`Error: ${errorMessage}. ${onRetry ? 'Tap to retry' : ''}`}
      >
        <MaterialCommunityIcons name={config.icon} size={20} color={config.color} />
        <Text style={[styles.compactText, { color: config.color }]} numberOfLines={1}>
          {errorMessage}
        </Text>
        {onRetry && (
          <MaterialCommunityIcons name="refresh" size={18} color={config.color} />
        )}
      </TouchableOpacity>
    );
  }

  return (
    <GlassCard
      variant={errorType === 'network' || errorType === 'validation' ? 'warning' : 'error'}
      style={styles.card}
      padding={24}
    >
      <View
        style={styles.container}
        accessibilityRole="alert"
        accessibilityLiveRegion="assertive"
      >
        <View style={[styles.iconContainer, { backgroundColor: `${config.color}20` }]}>
          <MaterialCommunityIcons name={config.icon} size={32} color={config.color} />
        </View>

        <Text style={styles.title}>{title || config.title}</Text>
        <Text style={styles.message}>{errorMessage}</Text>
        <Text style={styles.suggestion}>{config.suggestion}</Text>

        {onRetry && (
          <Button
            mode="contained"
            onPress={onRetry}
            style={styles.retryButton}
            buttonColor={config.color}
            accessibilityLabel={retryLabel}
          >
            {retryLabel}
          </Button>
        )}
      </View>
    </GlassCard>
  );
}

// Inline error for forms
interface InlineErrorProps {
  error: string | null;
}

export function InlineError({ error }: InlineErrorProps) {
  if (!error) return null;

  return (
    <View style={styles.inlineContainer} accessibilityRole="alert">
      <MaterialCommunityIcons name="alert-circle" size={14} color={colors.error} />
      <Text style={styles.inlineText}>{error}</Text>
    </View>
  );
}

// Toast-style error notification
interface ErrorToastProps {
  error: string | null;
  onDismiss?: () => void;
}

export function ErrorToast({ error, onDismiss }: ErrorToastProps) {
  if (!error) return null;

  return (
    <View style={styles.toastContainer}>
      <View style={styles.toastContent}>
        <MaterialCommunityIcons name="alert-circle" size={20} color={colors.white} />
        <Text style={styles.toastText} numberOfLines={2}>
          {error}
        </Text>
        {onDismiss && (
          <TouchableOpacity onPress={onDismiss} accessibilityRole="button" accessibilityLabel="Dismiss error">
            <MaterialCommunityIcons name="close" size={20} color={colors.white} />
          </TouchableOpacity>
        )}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  // Card style
  card: {
    marginHorizontal: 16,
    marginVertical: 8,
  },
  container: {
    alignItems: 'center',
  },
  iconContainer: {
    width: 64,
    height: 64,
    borderRadius: 32,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 16,
  },
  title: {
    color: colors.textPrimary,
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 8,
    textAlign: 'center',
  },
  message: {
    color: colors.textSecondary,
    fontSize: 14,
    textAlign: 'center',
    marginBottom: 8,
  },
  suggestion: {
    color: colors.textMuted,
    fontSize: 12,
    textAlign: 'center',
    marginBottom: 16,
  },
  retryButton: {
    borderRadius: glass.border.radius.md,
    minWidth: 120,
  },

  // Compact style
  compactContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: `${colors.error}15`,
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 8,
    gap: 8,
    marginVertical: 8,
  },
  compactText: {
    flex: 1,
    fontSize: 13,
    fontWeight: '500',
  },

  // Inline style
  inlineContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    marginTop: 4,
    marginBottom: 8,
  },
  inlineText: {
    color: colors.error,
    fontSize: 12,
  },

  // Toast style
  toastContainer: {
    position: 'absolute',
    bottom: 100,
    left: 16,
    right: 16,
    zIndex: 999,
  },
  toastContent: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.error,
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderRadius: glass.border.radius.md,
    gap: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 8,
  },
  toastText: {
    flex: 1,
    color: colors.white,
    fontSize: 14,
    fontWeight: '500',
  },
});

export default memo(ErrorDisplay);
