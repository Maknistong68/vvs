import { MD3DarkTheme } from 'react-native-paper';

// Professional Dark Theme - Clean & Modern
export const colors = {
  // Primary - Vibrant Blue
  primary: '#3B82F6',
  primaryLight: '#60A5FA',
  primaryDark: '#2563EB',

  // Secondary - Teal
  secondary: '#14B8A6',
  secondaryLight: '#2DD4BF',
  secondaryDark: '#0D9488',

  // Status colors - Vibrant
  success: '#22C55E',
  successLight: '#4ADE80',
  warning: '#F59E0B',
  warningLight: '#FBBF24',
  error: '#EF4444',
  errorLight: '#F87171',
  info: '#3B82F6',
  infoLight: '#60A5FA',

  // Base
  white: '#FFFFFF',
  black: '#000000',

  // Backgrounds - True dark
  background: '#111827', // Gray 900
  backgroundLight: '#1F2937', // Gray 800
  backgroundLighter: '#374151', // Gray 700

  // Cards - Slightly lighter than background
  card: '#1F2937',
  cardBorder: '#374151',
  cardElevated: '#263244',

  // Surface
  surface: '#1F2937',
  surfaceLight: '#374151',

  // Text - High contrast
  textPrimary: '#F9FAFB', // Gray 50
  textSecondary: '#D1D5DB', // Gray 300
  textMuted: '#9CA3AF', // Gray 400

  // Input
  inputBackground: '#1F2937',
  inputBorder: '#4B5563',
};

// Card styles
export const glassStyles = {
  card: {
    backgroundColor: colors.card,
    borderWidth: 1,
    borderColor: colors.cardBorder,
    borderRadius: 16,
  },
  cardElevated: {
    backgroundColor: colors.cardElevated,
    borderWidth: 1,
    borderColor: colors.cardBorder,
    borderRadius: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.25,
    shadowRadius: 8,
    elevation: 8,
  },
};

// Gradients
export const gradients = {
  primary: ['#3B82F6', '#2563EB', '#1D4ED8'],
  secondary: ['#14B8A6', '#0D9488', '#0F766E'],
  success: ['#22C55E', '#16A34A', '#15803D'],
  warning: ['#F59E0B', '#D97706', '#B45309'],
  error: ['#EF4444', '#DC2626', '#B91C1C'],
  dark: ['#111827', '#1F2937'],
};

// Paper theme
export const paperTheme = {
  ...MD3DarkTheme,
  colors: {
    ...MD3DarkTheme.colors,
    primary: colors.primary,
    primaryContainer: colors.primaryDark,
    secondary: colors.secondary,
    secondaryContainer: colors.secondaryDark,
    error: colors.error,
    background: colors.background,
    surface: colors.surface,
    surfaceVariant: colors.surfaceLight,
    onPrimary: colors.white,
    onSecondary: colors.white,
    onBackground: colors.textPrimary,
    onSurface: colors.textPrimary,
    outline: colors.cardBorder,
  },
  roundness: 12,
};

// Status badges - Compact, readable (matches Excel statuses)
export const statusColors: Record<string, { bg: string; text: string; icon: string }> = {
  // Vehicle/Inspection statuses (from Excel)
  verified: { bg: 'rgba(34, 197, 94, 0.15)', text: '#4ADE80', icon: 'check-circle' },
  rejected: { bg: 'rgba(239, 68, 68, 0.15)', text: '#F87171', icon: 'close-circle' },
  pending: { bg: 'rgba(245, 158, 11, 0.15)', text: '#FBBF24', icon: 'clock-outline' },
  // Expected statuses (from Excel)
  inspection_overdue: { bg: 'rgba(239, 68, 68, 0.15)', text: '#F87171', icon: 'calendar-alert' },
  updated_inspection_required: { bg: 'rgba(245, 158, 11, 0.15)', text: '#FBBF24', icon: 'calendar-clock' },
  // Legacy/general statuses
  pass: { bg: 'rgba(34, 197, 94, 0.15)', text: '#4ADE80', icon: 'check-circle' },
  fail: { bg: 'rgba(239, 68, 68, 0.15)', text: '#F87171', icon: 'close-circle' },
  valid: { bg: 'rgba(34, 197, 94, 0.15)', text: '#4ADE80', icon: 'check-decagram' },
  expired: { bg: 'rgba(239, 68, 68, 0.15)', text: '#F87171', icon: 'calendar-remove' },
  revoked: { bg: 'rgba(239, 68, 68, 0.15)', text: '#F87171', icon: 'cancel' },
  active: { bg: 'rgba(34, 197, 94, 0.15)', text: '#4ADE80', icon: 'check-circle' },
  inactive: { bg: 'rgba(156, 163, 175, 0.15)', text: '#9CA3AF', icon: 'pause-circle' },
  draft: { bg: 'rgba(156, 163, 175, 0.15)', text: '#9CA3AF', icon: 'file-edit' },
  issued: { bg: 'rgba(20, 184, 166, 0.15)', text: '#2DD4BF', icon: 'sticker-check' },
  lost: { bg: 'rgba(156, 163, 175, 0.15)', text: '#9CA3AF', icon: 'help-circle' },
  terminated: { bg: 'rgba(239, 68, 68, 0.15)', text: '#F87171', icon: 'close-circle' },
  suspended: { bg: 'rgba(245, 158, 11, 0.15)', text: '#FBBF24', icon: 'pause-circle' },
  pending_renewal: { bg: 'rgba(59, 130, 246, 0.15)', text: '#60A5FA', icon: 'calendar-refresh' },
};

// Equipment icons (matches Excel 25 types)
export const equipmentIcons: Record<string, string> = {
  forklift: 'forklift',
  backhoe: 'excavator',
  bulldozer: 'bulldozer',
  bus_minibus_coach: 'bus',
  concrete_mixer_bulker: 'truck-delivery',
  concrete_pump_truck: 'truck',
  coring_drilling: 'hammer',
  crawler_crane: 'crane',
  dump_truck_articulated: 'dump-truck',
  dyna_mini_truck: 'truck',
  excavator_tracked: 'excavator',
  flatbed_trailer: 'truck-trailer',
  grader: 'road-variant',
  hiab_boom_truck: 'crane',
  light_vehicle: 'car',
  mewp: 'elevator-up',
  mobile_crane_wheeled: 'crane',
  roller_compactor: 'road-variant',
  service_truck: 'truck',
  sewage_truck: 'tanker-truck',
  skid_steer_loader: 'tractor-variant',
  tanker_truck: 'tanker-truck',
  telehandler: 'forklift',
  wheeled_loader: 'tractor',
  ambulance: 'ambulance',
  other: 'cog',
};

// Rejection category icons (from Excel failure reasons)
export const rejectionCategoryIcons: Record<string, { icon: string; color: string }> = {
  freelance: { icon: 'account-off', color: '#F59E0B' },
  old_model: { icon: 'car-clock', color: '#8B5CF6' },
  safety: { icon: 'shield-alert', color: '#EF4444' },
  documentation: { icon: 'file-alert', color: '#3B82F6' },
  mechanical: { icon: 'wrench', color: '#6B7280' },
};

// Equipment category colors
export const categoryColors: Record<string, string> = {
  A: '#3B82F6', // Heavy Equipment - Blue
  B: '#22C55E', // Vehicles - Green
  C: '#8B5CF6', // Special - Purple
};

export default { colors, glassStyles, gradients, paperTheme, statusColors, equipmentIcons, rejectionCategoryIcons, categoryColors };
