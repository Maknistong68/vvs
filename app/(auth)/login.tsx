import React, { useState } from 'react';
import { View, StyleSheet, KeyboardAvoidingView, Platform, ScrollView } from 'react-native';
import { TextInput, Button, Text, HelperText, Surface } from 'react-native-paper';
import { useRouter } from 'expo-router';
import { useAuth } from '../../lib/auth';

export default function LoginScreen() {
  const router = useRouter();
  const { signIn, signUp } = useAuth();

  const [isLogin, setIsLogin] = useState(true);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [fullName, setFullName] = useState('');
  const [companyCode, setCompanyCode] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [successMessage, setSuccessMessage] = useState<string | null>(null);
  const [showPassword, setShowPassword] = useState(false);

  const handleSubmit = async () => {
    if (!email || !password) {
      setError('Please fill in all required fields');
      return;
    }

    if (!isLogin && !fullName) {
      setError('Please enter your full name');
      return;
    }

    if (!isLogin && !companyCode) {
      setError('Please enter your company code');
      return;
    }

    setLoading(true);
    setError(null);
    setSuccessMessage(null);

    try {
      if (isLogin) {
        const { error } = await signIn(email, password);
        if (error) {
          setError(error.message);
        } else {
          router.replace('/(tabs)');
        }
      } else {
        const { error } = await signUp(email, password, fullName, companyCode);
        if (error) {
          setError(error.message);
        } else {
          setSuccessMessage('Account created! Please check your email to verify, then login.');
          setIsLogin(true);
          setEmail('');
          setPassword('');
          setFullName('');
          setCompanyCode('');
        }
      }
    } catch (err) {
      setError('An unexpected error occurred');
    } finally {
      setLoading(false);
    }
  };

  return (
    <KeyboardAvoidingView
      style={styles.container}
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
    >
      <ScrollView
        contentContainerStyle={styles.scrollContent}
        keyboardShouldPersistTaps="handled"
      >
        <Surface style={styles.surface} elevation={2}>
          <Text variant="headlineMedium" style={styles.title}>
            VVS Inspection
          </Text>
          <Text variant="titleSmall" style={styles.tagline}>
            Vehicle Verification System
          </Text>
          <Text variant="bodyMedium" style={styles.subtitle}>
            {isLogin ? 'Sign in to continue' : 'Create a new account'}
          </Text>

          {!isLogin && (
            <>
              <TextInput
                label="Full Name"
                value={fullName}
                onChangeText={setFullName}
                style={styles.input}
                mode="outlined"
                autoCapitalize="words"
                left={<TextInput.Icon icon="account" />}
              />
              <TextInput
                label="Company Code"
                value={companyCode}
                onChangeText={(text) => setCompanyCode(text.toUpperCase())}
                style={styles.input}
                mode="outlined"
                autoCapitalize="characters"
                placeholder="e.g., ACME"
                left={<TextInput.Icon icon="domain" />}
              />
              <HelperText type="info" visible>
                Ask your company admin for the company code
              </HelperText>
            </>
          )}

          <TextInput
            label="Email"
            value={email}
            onChangeText={setEmail}
            style={styles.input}
            mode="outlined"
            keyboardType="email-address"
            autoCapitalize="none"
            autoComplete="email"
            left={<TextInput.Icon icon="email" />}
          />

          <TextInput
            label="Password"
            value={password}
            onChangeText={setPassword}
            style={styles.input}
            mode="outlined"
            secureTextEntry={!showPassword}
            autoCapitalize="none"
            left={<TextInput.Icon icon="lock" />}
            right={
              <TextInput.Icon
                icon={showPassword ? 'eye-off' : 'eye'}
                onPress={() => setShowPassword(!showPassword)}
              />
            }
          />

          {error && (
            <HelperText type="error" visible>
              {error}
            </HelperText>
          )}

          {successMessage && (
            <HelperText type="info" visible style={styles.successText}>
              {successMessage}
            </HelperText>
          )}

          <Button
            mode="contained"
            onPress={handleSubmit}
            loading={loading}
            disabled={loading}
            style={styles.button}
          >
            {isLogin ? 'Sign In' : 'Sign Up'}
          </Button>

          <Button
            mode="text"
            onPress={() => {
              setIsLogin(!isLogin);
              setError(null);
              setSuccessMessage(null);
            }}
            style={styles.switchButton}
          >
            {isLogin
              ? "Don't have an account? Sign Up"
              : 'Already have an account? Sign In'}
          </Button>
        </Surface>
      </ScrollView>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  scrollContent: {
    flexGrow: 1,
    justifyContent: 'center',
    padding: 20,
  },
  surface: {
    padding: 24,
    borderRadius: 12,
    backgroundColor: 'white',
  },
  title: {
    textAlign: 'center',
    marginBottom: 4,
    fontWeight: 'bold',
    color: '#6200EE',
  },
  tagline: {
    textAlign: 'center',
    marginBottom: 8,
    color: '#666',
  },
  subtitle: {
    textAlign: 'center',
    marginBottom: 24,
    color: '#999',
  },
  input: {
    marginBottom: 8,
  },
  button: {
    marginTop: 16,
    paddingVertical: 6,
  },
  switchButton: {
    marginTop: 16,
  },
  successText: {
    color: '#4CAF50',
  },
});
