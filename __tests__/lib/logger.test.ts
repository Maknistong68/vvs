// Tests for lib/logger.ts
import { logger, createPerformanceTimer, categorizeApiError } from '../../lib/logger';

// Mock console methods
const mockConsole = {
  log: jest.spyOn(console, 'log').mockImplementation(),
  info: jest.spyOn(console, 'info').mockImplementation(),
  warn: jest.spyOn(console, 'warn').mockImplementation(),
  error: jest.spyOn(console, 'error').mockImplementation(),
};

describe('Logger', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    logger.clearLogs();
  });

  afterAll(() => {
    Object.values(mockConsole).forEach(mock => mock.mockRestore());
  });

  describe('logging methods', () => {
    it('should log debug messages', () => {
      logger.debug('Debug message', { key: 'value' });
      expect(mockConsole.log).toHaveBeenCalled();
    });

    it('should log info messages', () => {
      logger.info('Info message');
      expect(mockConsole.info).toHaveBeenCalled();
    });

    it('should log warning messages', () => {
      logger.warn('Warning message');
      expect(mockConsole.warn).toHaveBeenCalled();
    });

    it('should log error messages', () => {
      logger.error('Error message', new Error('Test error'));
      expect(mockConsole.error).toHaveBeenCalled();
    });
  });

  describe('log buffer', () => {
    it('should store logs in buffer', () => {
      logger.info('Test message');
      const logs = logger.getRecentLogs();
      expect(logs.length).toBeGreaterThan(0);
      expect(logs[logs.length - 1].message).toBe('Test message');
    });

    it('should clear logs', () => {
      logger.info('Test message');
      logger.clearLogs();
      expect(logger.getRecentLogs()).toHaveLength(0);
    });
  });

  describe('specialized logging', () => {
    it('should log API calls', () => {
      logger.logApiCall('GET', '/api/vehicles', 'success', { count: 10 });
      expect(mockConsole.log).toHaveBeenCalled();
    });

    it('should log API errors', () => {
      logger.logApiCall('POST', '/api/vehicles', 'error', { error: 'Failed' });
      expect(mockConsole.error).toHaveBeenCalled();
    });

    it('should log user actions', () => {
      logger.logUserAction('button_click', { button: 'submit' });
      expect(mockConsole.info).toHaveBeenCalled();
    });

    it('should log navigation', () => {
      logger.logNavigation('home', 'settings');
      expect(mockConsole.log).toHaveBeenCalled();
    });

    it('should log performance metrics', () => {
      logger.logPerformance('fetchData', 150);
      expect(mockConsole.log).toHaveBeenCalled();
    });
  });
});

describe('createPerformanceTimer', () => {
  it('should measure elapsed time', async () => {
    const endTimer = createPerformanceTimer('test-operation');

    // Wait a bit
    await new Promise(resolve => setTimeout(resolve, 10));

    endTimer();
    expect(mockConsole.log).toHaveBeenCalled();
  });
});

describe('categorizeApiError', () => {
  it('should categorize network errors', () => {
    const error = categorizeApiError(new Error('Network failed'), '/api/test');
    expect(error.type).toBe('network');
    expect(error.recoverable).toBe(true);
  });

  it('should categorize auth errors', () => {
    const error = categorizeApiError(new Error('Unauthorized access'), '/api/test');
    expect(error.type).toBe('auth');
  });

  it('should categorize permission errors', () => {
    const error = categorizeApiError(new Error('403 Forbidden'), '/api/test');
    expect(error.type).toBe('permission');
    expect(error.recoverable).toBe(false);
  });

  it('should categorize validation errors', () => {
    const error = categorizeApiError(new Error('Validation failed'), '/api/test');
    expect(error.type).toBe('validation');
  });

  it('should categorize server errors', () => {
    const error = categorizeApiError(new Error('500 Internal Server Error'), '/api/test');
    expect(error.type).toBe('server');
  });

  it('should default to unknown for other errors', () => {
    const error = categorizeApiError(new Error('Something happened'), '/api/test');
    expect(error.type).toBe('unknown');
  });
});
