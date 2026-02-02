import React, { useState } from 'react';
import { View, StyleSheet, KeyboardAvoidingView, Platform, ScrollView, StatusBar } from 'react-native';
import { TextInput, Button, Text, HelperText } from 'react-native-paper';
import { LinearGradient } from 'expo-linear-gradient';
import { useRouter } from 'expo-router';
import { useAuth } from '../../lib/auth';
import { colors, gradients, glass } from '../../lib/theme';
import { MIN_PASSWORD_LENGTH, EMAIL_REGEX, validatePassword, getPasswordRequirementsSummary } from '../../lib/constants';
import { logger } from '../../lib/logger';
import GlassCard from '../../components/GlassCard';
import GlassBackground from '../../components/GlassBackground';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';

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
  const [success, setSuccess] = useState<string | null>(null);
  const [showPass, setShowPass] = useState(false);

  const validateEmail = (emailValue: string) => EMAIL_REGEX.test(emailValue);

  const handleSubmit = async () => {
    // Basic field validation
    if (!email || !password) { setError('Please fill in all fields'); return; }
    if (!validateEmail(email)) { setError('Please enter a valid email address'); return; }

    // Password validation - different rules for login vs signup
    if (isLogin) {
      // For login, just check minimum length (legacy support)
      if (password.length < 6) { setError('Invalid password'); return; }
    } else {
      // For signup, enforce strong password requirements
      const passwordValidation = validatePassword(password);
      if (!passwordValidation.isValid) {
        setError(passwordValidation.errors[0]); // Show first error
        return;
      }
    }

    if (!isLogin && !fullName.trim()) { setError('Please enter your name'); return; }
    if (!isLogin && !companyCode.trim()) { setError('Please enter your company code'); return; }

    setLoading(true);
    setError(null);
    setSuccess(null);

    try {
      if (isLogin) {
        logger.logUserAction('sign_in_attempt', { email });
        const { error } = await signIn(email, password);
        if (error) {
          logger.error('Sign in failed', error, { email });
          setError(error.message);
        } else {
          logger.logUserAction('sign_in_success', { email });
          router.replace('/(tabs)');
        }
      } else {
        logger.logUserAction('sign_up_attempt', { email, companyCode });
        const { error } = await signUp(email, password, fullName.trim(), companyCode.trim());
        if (error) {
          logger.error('Sign up failed', error, { email });
          setError(error.message);
        } else {
          logger.logUserAction('sign_up_success', { email });
          setSuccess('Account created! Please check your email to verify, then log in.');
          setIsLogin(true);
          setEmail('');
          setPassword('');
          setFullName('');
          setCompanyCode('');
        }
      }
    } catch (err) {
      logger.error('Authentication error', err);
      setError('An unexpected error occurred. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <GlassBackground>
      <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
      <KeyboardAvoidingView style={styles.flex} behavior={Platform.OS === 'ios' ? 'padding' : 'height'}>
        <ScrollView contentContainerStyle={styles.scroll} keyboardShouldPersistTaps="handled" showsVerticalScrollIndicator={false}>
          {/* Logo */}
          <View style={styles.logoWrap}>
            <LinearGradient
              colors={gradients.primary as [string, string, ...string[]]}
              style={styles.logoGradient}
              start={{ x: 0, y: 0 }}
              end={{ x: 1, y: 1 }}
            >
              <View style={styles.logo}>
                <MaterialCommunityIcons name="car-multiple" size={44} color={colors.white} />
              </View>
            </LinearGradient>
          </View>

          <GlassCard elevated style={styles.card} padding={28}>
            <Text style={styles.title}>VVS Inspection</Text>
            <Text style={styles.subtitle}>{isLogin ? 'Sign in to continue' : 'Create your account'}</Text>

            {!isLogin && (
              <>
                <TextInput
                  label="Full Name"
                  value={fullName}
                  onChangeText={setFullName}
                  style={styles.input}
                  mode="outlined"
                  autoCapitalize="words"
                  left={<TextInput.Icon icon="account" color={colors.textMuted} />}
                  outlineColor={colors.inputBorder}
                  activeOutlineColor={colors.primary}
                  textColor={colors.textPrimary}
                  theme={{ colors: { onSurfaceVariant: colors.textMuted } }}
                />
                <TextInput
                  label="Company Code"
                  value={companyCode}
                  onChangeText={(t) => setCompanyCode(t.toUpperCase())}
                  style={styles.input}
                  mode="outlined"
                  autoCapitalize="characters"
                  left={<TextInput.Icon icon="domain" color={colors.textMuted} />}
                  outlineColor={colors.inputBorder}
                  activeOutlineColor={colors.primary}
                  textColor={colors.textPrimary}
                  theme={{ colors: { onSurfaceVariant: colors.textMuted } }}
                />
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
              left={<TextInput.Icon icon="email" color={colors.textMuted} />}
              outlineColor={colors.inputBorder}
              activeOutlineColor={colors.primary}
              textColor={colors.textPrimary}
              theme={{ colors: { onSurfaceVariant: colors.textMuted } }}
            />
            <TextInput
              label="Password"
              value={password}
              onChangeText={setPassword}
              style={styles.input}
              mode="outlined"
              secureTextEntry={!showPass}
              autoCapitalize="none"
              left={<TextInput.Icon icon="lock" color={colors.textMuted} />}
              right={<TextInput.Icon icon={showPass ? 'eye-off' : 'eye'} color={colors.textMuted} onPress={() => setShowPass(!showPass)} />}
              outlineColor={colors.inputBorder}
              activeOutlineColor={colors.primary}
              textColor={colors.textPrimary}
              theme={{ colors: { onSurfaceVariant: colors.textMuted } }}
              accessibilityLabel="Password input"
              accessibilityHint={!isLogin ? getPasswordRequirementsSummary() : undefined}
            />
            {!isLogin && (
              <Text style={styles.passwordHint}>
                {getPasswordRequirementsSummary()}
              </Text>
            )}

            {error && <HelperText type="error" visible style={styles.error}>{error}</HelperText>}
            {success && <HelperText type="info" visible style={styles.success}>{success}</HelperText>}

            <View style={styles.btnWrap}>
              <LinearGradient
                colors={gradients.primary as [string, string, ...string[]]}
                start={{ x: 0, y: 0 }}
                end={{ x: 1, y: 0 }}
                style={styles.gradient}
              >
                <Button
                  mode="contained"
                  onPress={handleSubmit}
                  loading={loading}
                  disabled={loading}
                  style={styles.btn}
                  contentStyle={styles.btnContent}
                  labelStyle={styles.btnLabel}
                  buttonColor="transparent"
                >
                  {isLogin ? 'Sign In' : 'Sign Up'}
                </Button>
              </LinearGradient>
            </View>

            <Button
              mode="text"
              onPress={() => { setIsLogin(!isLogin); setError(null); setSuccess(null); }}
              labelStyle={styles.switchLabel}
            >
              {isLogin ? "Don't have an account? Sign Up" : 'Already have an account? Sign In'}
            </Button>
          </GlassCard>

          {/* Footer */}
          <View style={styles.footer}>
            <Text style={styles.footerText}>Vehicle Verification System</Text>
            <View style={styles.footerDot} />
            <Text style={styles.footerText}>v2.0.0</Text>
          </View>
        </ScrollView>
      </KeyboardAvoidingView>
    </GlassBackground>
  );
}

const styles = StyleSheet.create({
  flex: { flex: 1 },
  scroll: { flexGrow: 1, justifyContent: 'center', padding: 20 },
  logoWrap: { alignItems: 'center', marginBottom: 24 },
  logoGradient: {
    width: 100,
    height: 100,
    borderRadius: 50,
    justifyContent: 'center',
    alignItems: 'center',
    ...Platform.select({
      ios: {
        shadowColor: colors.primary,
        shadowOffset: { width: 0, height: 8 },
        shadowOpacity: 0.4,
        shadowRadius: 16,
      },
      android: {
        elevation: 8,
      },
    }),
  },
  logo: {
    width: 90,
    height: 90,
    borderRadius: 45,
    justifyContent: 'center',
    alignItems: 'center',
  },
  card: { marginHorizontal: 0 },
  title: {
    textAlign: 'center',
    fontSize: 28,
    fontWeight: 'bold',
    color: colors.textPrimary,
    marginBottom: 4
  },
  subtitle: {
    textAlign: 'center',
    color: colors.textSecondary,
    marginBottom: 24,
    fontSize: 15
  },
  input: {
    marginBottom: 14,
    backgroundColor: colors.inputBackground
  },
  error: { color: colors.error, fontSize: 13 },
  success: { color: colors.success, fontSize: 13 },
  passwordHint: {
    color: colors.textMuted,
    fontSize: 11,
    marginTop: -8,
    marginBottom: 8,
    paddingHorizontal: 4,
  },
  btnWrap: {
    marginTop: 16,
    borderRadius: glass.border.radius.md,
    overflow: 'hidden'
  },
  gradient: { borderRadius: glass.border.radius.md },
  btn: { borderRadius: glass.border.radius.md },
  btnContent: { paddingVertical: 8 },
  btnLabel: { color: colors.white, fontSize: 16, fontWeight: '600' },
  switchLabel: { color: colors.textSecondary, marginTop: 16, fontSize: 14 },
  footer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 32,
    gap: 8,
  },
  footerText: { color: colors.textMuted, fontSize: 12 },
  footerDot: {
    width: 4,
    height: 4,
    borderRadius: 2,
    backgroundColor: colors.textMuted,
  },
});
