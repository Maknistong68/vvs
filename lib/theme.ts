import { MD3DarkTheme } from 'react-native-paper';

// Professional Dark Theme with Glassmorphism
export const colors = {
  // Primary - Vibrant Blue
  primary: '#3B82F6',
  primaryLight: '#60A5FA',
  primaryDark: '#2563EB',

  // Secondary - Teal
  secondary: '#14B8A6',
  secondaryLight: '#2DD4BF',
  secondaryDark: '#0D9488',

  // Accent - Purple
  accent: '#8B5CF6',
  accentLight: '#A78BFA',
  accentDark: '#7C3AED',

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

  // Backgrounds - True dark for glass effect
  background: '#0F172A', // Slate 900
  backgroundLight: '#1E293B', // Slate 800
  backgroundLighter: '#334155', // Slate 700

  // Cards - Glass effect bases
  card: 'rgba(30, 41, 59, 0.7)', // Slate 800 with transparency
  cardSolid: '#1E293B',
  cardBorder: 'rgba(255, 255, 255, 0.1)',
  cardElevated: 'rgba(51, 65, 85, 0.6)',

  // Surface
  surface: '#1E293B',
  surfaceLight: '#334155',

  // Text - High contrast
  textPrimary: '#F8FAFC', // Slate 50
  textSecondary: '#CBD5E1', // Slate 300
  textMuted: '#94A3B8', // Slate 400

  // Input
  inputBackground: 'rgba(30, 41, 59, 0.8)',
  inputBorder: 'rgba(148, 163, 184, 0.3)',
};

// Glassmorphism configuration
export const glass = {
  blur: {
    light: 10,
    medium: 20,
    heavy: 40,
  },
  background: {
    primary: 'rgba(15, 23, 42, 0.75)',
    card: 'rgba(30, 41, 59, 0.5)',
    elevated: 'rgba(51, 65, 85, 0.6)',
    overlay: 'rgba(0, 0, 0, 0.5)',
  },
  border: {
    color: 'rgba(255, 255, 255, 0.1)',
    colorLight: 'rgba(255, 255, 255, 0.15)',
    width: 1,
    radius: {
      sm: 12,
      md: 16,
      lg: 20,
      xl: 24,
    },
  },
  shadow: {
    color: 'rgba(0, 0, 0, 0.25)',
    offset: { width: 0, height: 8 },
    radius: 16,
    elevation: 8,
  },
  // Decorative orb colors for background
  orbs: {
    primary: 'rgba(59, 130, 246, 0.15)', // Blue
    secondary: 'rgba(139, 92, 246, 0.15)', // Purple
    accent: 'rgba(20, 184, 166, 0.12)', // Teal
  },
};

// Gradients
export const gradients = {
  primary: ['#3B82F6', '#2563EB', '#1D4ED8'],
  secondary: ['#14B8A6', '#0D9488', '#0F766E'],
  accent: ['#8B5CF6', '#7C3AED', '#6D28D9'],
  success: ['#22C55E', '#16A34A', '#15803D'],
  warning: ['#F59E0B', '#D97706', '#B45309'],
  error: ['#EF4444', '#DC2626', '#B91C1C'],
  dark: ['#0F172A', '#1E293B'],
  glass: ['rgba(59, 130, 246, 0.1)', 'rgba(139, 92, 246, 0.1)'],
  // Background gradient
  background: ['#0F172A', '#1E293B'],
};

// Card styles with glass effect
export const glassStyles = {
  card: {
    backgroundColor: glass.background.card,
    borderWidth: glass.border.width,
    borderColor: glass.border.color,
    borderRadius: glass.border.radius.md,
  },
  cardElevated: {
    backgroundColor: glass.background.elevated,
    borderWidth: glass.border.width,
    borderColor: glass.border.colorLight,
    borderRadius: glass.border.radius.lg,
    shadowColor: glass.shadow.color,
    shadowOffset: glass.shadow.offset,
    shadowOpacity: 1,
    shadowRadius: glass.shadow.radius,
    elevation: glass.shadow.elevation,
  },
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

// Role colors
export const roleColors: Record<string, string> = {
  owner: '#F59E0B', // Warning/Gold
  admin: '#3B82F6', // Primary/Blue
  inspector: '#22C55E', // Success/Green
  contractor: '#8B5CF6', // Accent/Purple
};

export default { colors, glass, glassStyles, gradients, paperTheme, statusColors, equipmentIcons, rejectionCategoryIcons, categoryColors, roleColors };
