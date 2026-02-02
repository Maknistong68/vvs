// Tests for lib/constants.ts
import {
  validatePassword,
  getPasswordRequirementsSummary,
  getErrorMessage,
  createAppError,
  isNetworkError,
  MIN_PASSWORD_LENGTH,
  PASSWORD_REQUIREMENTS,
} from '../../lib/constants';

describe('Password Validation', () => {
  describe('validatePassword', () => {
    it('should reject passwords shorter than minimum length', () => {
      const result = validatePassword('Short1!');
      expect(result.isValid).toBe(false);
      expect(result.errors).toContain(`Password must be at least ${PASSWORD_REQUIREMENTS.minLength} characters`);
    });

    it('should reject passwords without uppercase letters', () => {
      const result = validatePassword('lowercase123!@#');
      expect(result.isValid).toBe(false);
      expect(result.errors).toContain('Password must contain at least one uppercase letter');
    });

    it('should reject passwords without lowercase letters', () => {
      const result = validatePassword('UPPERCASE123!@#');
      expect(result.isValid).toBe(false);
      expect(result.errors).toContain('Password must contain at least one lowercase letter');
    });

    it('should reject passwords without numbers', () => {
      const result = validatePassword('NoNumbers!@#abc');
      expect(result.isValid).toBe(false);
      expect(result.errors).toContain('Password must contain at least one number');
    });

    it('should reject passwords without special characters', () => {
      const result = validatePassword('NoSpecial123abc');
      expect(result.isValid).toBe(false);
      expect(result.errors).toContain('Password must contain at least one special character (!@#$%^&*...)');
    });

    it('should accept valid passwords', () => {
      const result = validatePassword('ValidPass123!@#');
      expect(result.isValid).toBe(true);
      expect(result.errors).toHaveLength(0);
    });

    it('should accept complex passwords', () => {
      const result = validatePassword('MyC0mpl3x!P@ssw0rd');
      expect(result.isValid).toBe(true);
      expect(result.errors).toHaveLength(0);
    });
  });

  describe('getPasswordRequirementsSummary', () => {
    it('should return a non-empty string', () => {
      const summary = getPasswordRequirementsSummary();
      expect(typeof summary).toBe('string');
      expect(summary.length).toBeGreaterThan(0);
    });

    it('should mention minimum length', () => {
      const summary = getPasswordRequirementsSummary();
      expect(summary).toContain(String(PASSWORD_REQUIREMENTS.minLength));
    });
  });

  describe('MIN_PASSWORD_LENGTH', () => {
    it('should be at least 12', () => {
      expect(MIN_PASSWORD_LENGTH).toBeGreaterThanOrEqual(12);
    });
  });
});

describe('Error Handling', () => {
  describe('getErrorMessage', () => {
    it('should extract message from Error object', () => {
      const error = new Error('Test error message');
      expect(getErrorMessage(error)).toBe('Test error message');
    });

    it('should return string errors as-is', () => {
      expect(getErrorMessage('String error')).toBe('String error');
    });

    it('should return fallback for non-error types', () => {
      expect(getErrorMessage(null)).toBe('An error occurred');
      expect(getErrorMessage(undefined)).toBe('An error occurred');
      expect(getErrorMessage(123)).toBe('An error occurred');
    });

    it('should use custom fallback when provided', () => {
      expect(getErrorMessage(null, 'Custom fallback')).toBe('Custom fallback');
    });
  });

  describe('createAppError', () => {
    it('should create AppError with correct structure', () => {
      const error = new Error('Test');
      const appError = createAppError(error, 'network', true);

      expect(appError.type).toBe('network');
      expect(appError.message).toBe('Test');
      expect(appError.recoverable).toBe(true);
      expect(appError.originalError).toBe(error);
    });

    it('should default to unknown type and recoverable', () => {
      const appError = createAppError('Simple error');

      expect(appError.type).toBe('unknown');
      expect(appError.recoverable).toBe(true);
    });
  });

  describe('isNetworkError', () => {
    it('should detect network-related errors', () => {
      expect(isNetworkError(new Error('Network request failed'))).toBe(true);
      expect(isNetworkError(new Error('fetch error'))).toBe(true);
      expect(isNetworkError(new Error('Connection timeout'))).toBe(true);
      expect(isNetworkError(new Error('Device is offline'))).toBe(true);
    });

    it('should return false for non-network errors', () => {
      expect(isNetworkError(new Error('Validation failed'))).toBe(false);
      expect(isNetworkError(new Error('User not found'))).toBe(false);
      expect(isNetworkError('string error')).toBe(false);
      expect(isNetworkError(null)).toBe(false);
    });
  });
});
