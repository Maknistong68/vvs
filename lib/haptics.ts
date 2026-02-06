// Haptic Feedback Utility (W22)
// Provides haptic feedback for key interactions
// Safe for all platforms - silently no-ops on unsupported platforms

import { Platform } from 'react-native';

let Haptics: typeof import('expo-haptics') | null = null;

// Lazy load expo-haptics only on supported platforms
function getHaptics() {
  if (Haptics) return Haptics;
  if (Platform.OS === 'ios' || Platform.OS === 'android') {
    try {
      Haptics = require('expo-haptics');
    } catch {
      Haptics = null;
    }
  }
  return Haptics;
}

/** Light tap for button presses, selections, toggles */
export function hapticLight() {
  getHaptics()?.impactAsync(getHaptics()!.ImpactFeedbackStyle.Light);
}

/** Medium impact for confirmations, card presses */
export function hapticMedium() {
  getHaptics()?.impactAsync(getHaptics()!.ImpactFeedbackStyle.Medium);
}

/** Success notification for completed actions */
export function hapticSuccess() {
  getHaptics()?.notificationAsync(getHaptics()!.NotificationFeedbackType.Success);
}

/** Error notification for failed actions */
export function hapticError() {
  getHaptics()?.notificationAsync(getHaptics()!.NotificationFeedbackType.Error);
}

/** Warning notification */
export function hapticWarning() {
  getHaptics()?.notificationAsync(getHaptics()!.NotificationFeedbackType.Warning);
}

/** Selection changed feedback (for pickers, tabs) */
export function hapticSelection() {
  getHaptics()?.selectionAsync();
}
