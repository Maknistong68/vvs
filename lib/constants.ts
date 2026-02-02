// VVS Application Constants

// Authentication
export const AUTH_TIMEOUT_MS = 5000;
export const MIN_PASSWORD_LENGTH = 12;
export const SESSION_TIMEOUT_MS = 30 * 60 * 1000; // 30 minutes inactivity timeout

// Password complexity requirements
export const PASSWORD_REQUIREMENTS = {
  minLength: 12,
  requireUppercase: true,
  requireLowercase: true,
  requireNumber: true,
  requireSpecialChar: true,
};

// Password validation regex patterns
export const PASSWORD_REGEX = {
  uppercase: /[A-Z]/,
  lowercase: /[a-z]/,
  number: /[0-9]/,
  specialChar: /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/,
};

/**
 * Validates password meets all complexity requirements
 * Returns object with isValid boolean and array of error messages
 */
export function validatePassword(password: string): { isValid: boolean; errors: string[] } {
  const errors: string[] = [];

  if (password.length < PASSWORD_REQUIREMENTS.minLength) {
    errors.push(`Password must be at least ${PASSWORD_REQUIREMENTS.minLength} characters`);
  }

  if (PASSWORD_REQUIREMENTS.requireUppercase && !PASSWORD_REGEX.uppercase.test(password)) {
    errors.push('Password must contain at least one uppercase letter');
  }

  if (PASSWORD_REQUIREMENTS.requireLowercase && !PASSWORD_REGEX.lowercase.test(password)) {
    errors.push('Password must contain at least one lowercase letter');
  }

  if (PASSWORD_REQUIREMENTS.requireNumber && !PASSWORD_REGEX.number.test(password)) {
    errors.push('Password must contain at least one number');
  }

  if (PASSWORD_REQUIREMENTS.requireSpecialChar && !PASSWORD_REGEX.specialChar.test(password)) {
    errors.push('Password must contain at least one special character (!@#$%^&*...)');
  }

  return {
    isValid: errors.length === 0,
    errors,
  };
}

/**
 * Returns a user-friendly summary of password requirements
 */
export function getPasswordRequirementsSummary(): string {
  return `Password must be at least ${PASSWORD_REQUIREMENTS.minLength} characters and include uppercase, lowercase, number, and special character.`;
}

// Inspection
export const INSPECTION_PERIOD_MONTHS = 3;
export const CERTIFICATE_VALIDITY_YEARS = 1;

// UI
export const MENU_MAX_HEIGHT = 300;
export const DIALOG_MAX_HEIGHT = 400;

// Responsive breakpoints
export const BREAKPOINTS = {
  small: 320,
  medium: 768,
  large: 1024,
  xlarge: 1440,
};

// Validation
export const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

// API Limits
export const DEFAULT_PAGE_SIZE = 50;
export const MAX_PAGE_SIZE = 100;

// Network & Retry
export const RETRY_CONFIG = {
  maxRetries: 3,
  initialDelayMs: 1000,
  maxDelayMs: 10000,
  backoffMultiplier: 2,
};

// Error Handling
export const DEFAULT_ERROR_MESSAGE = 'An error occurred';

// Error types for better categorization
export type ErrorType = 'network' | 'validation' | 'auth' | 'permission' | 'server' | 'unknown';

export interface AppError {
  type: ErrorType;
  message: string;
  originalError?: unknown;
  recoverable: boolean;
}

/**
 * Safely extracts error message from unknown error type
 */
export function getErrorMessage(err: unknown, fallback = DEFAULT_ERROR_MESSAGE): string {
  if (err instanceof Error) return err.message;
  if (typeof err === 'string') return err;
  return fallback;
}

/**
 * Creates a typed AppError from an unknown error
 */
export function createAppError(
  err: unknown,
  type: ErrorType = 'unknown',
  recoverable = true
): AppError {
  return {
    type,
    message: getErrorMessage(err),
    originalError: err,
    recoverable,
  };
}

/**
 * Determines if an error is a network-related error
 */
export function isNetworkError(err: unknown): boolean {
  if (err instanceof Error) {
    const message = err.message.toLowerCase();
    return (
      message.includes('network') ||
      message.includes('fetch') ||
      message.includes('timeout') ||
      message.includes('connection') ||
      message.includes('offline')
    );
  }
  return false;
}
