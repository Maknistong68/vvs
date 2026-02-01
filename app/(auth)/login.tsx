import React, { useState } from 'react';
import { View, StyleSheet, KeyboardAvoidingView, Platform, ScrollView, StatusBar } from 'react-native';
import { TextInput, Button, Text, HelperText } from 'react-native-paper';
import { LinearGradient } from 'expo-linear-gradient';
import { useRouter } from 'expo-router';
import { useAuth } from '../../lib/auth';
import { colors, gradients } from '../../lib/theme';
import GlassCard from '../../components/GlassCard';
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

  const handleSubmit = async () => {
    if (!email || !password) { setError('Fill all fields'); return; }
    if (!isLogin && !fullName) { setError('Enter your name'); return; }
    if (!isLogin && !companyCode) { setError('Enter company code'); return; }

    setLoading(true);
    setError(null);
    setSuccess(null);

    try {
      if (isLogin) {
        const { error } = await signIn(email, password);
        if (error) setError(error.message);
        else router.replace('/(tabs)');
      } else {
        const { error } = await signUp(email, password, fullName, companyCode);
        if (error) setError(error.message);
        else {
          setSuccess('Account created! Check email then login.');
          setIsLogin(true);
          setEmail('');
          setPassword('');
          setFullName('');
          setCompanyCode('');
        }
      }
    } catch { setError('An error occurred'); }
    finally { setLoading(false); }
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor={colors.background} />
      <KeyboardAvoidingView style={styles.flex} behavior={Platform.OS === 'ios' ? 'padding' : 'height'}>
        <ScrollView contentContainerStyle={styles.scroll} keyboardShouldPersistTaps="handled" showsVerticalScrollIndicator={false}>
          {/* Logo */}
          <View style={styles.logoWrap}>
            <View style={styles.logo}>
              <MaterialCommunityIcons name="car-multiple" size={44} color={colors.primary} />
            </View>
          </View>

          <GlassCard elevated style={styles.card} padding={24}>
            <Text style={styles.title}>VVS Inspection</Text>
            <Text style={styles.subtitle}>{isLogin ? 'Sign in to continue' : 'Create account'}</Text>

            {!isLogin && (
              <>
                <TextInput label="Full Name" value={fullName} onChangeText={setFullName} style={styles.input} mode="outlined" autoCapitalize="words" left={<TextInput.Icon icon="account" color={colors.textMuted} />} outlineColor={colors.cardBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} theme={{ colors: { onSurfaceVariant: colors.textMuted } }} />
                <TextInput label="Company Code" value={companyCode} onChangeText={(t) => setCompanyCode(t.toUpperCase())} style={styles.input} mode="outlined" autoCapitalize="characters" left={<TextInput.Icon icon="domain" color={colors.textMuted} />} outlineColor={colors.cardBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} theme={{ colors: { onSurfaceVariant: colors.textMuted } }} />
              </>
            )}

            <TextInput label="Email" value={email} onChangeText={setEmail} style={styles.input} mode="outlined" keyboardType="email-address" autoCapitalize="none" left={<TextInput.Icon icon="email" color={colors.textMuted} />} outlineColor={colors.cardBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} theme={{ colors: { onSurfaceVariant: colors.textMuted } }} />
            <TextInput label="Password" value={password} onChangeText={setPassword} style={styles.input} mode="outlined" secureTextEntry={!showPass} autoCapitalize="none" left={<TextInput.Icon icon="lock" color={colors.textMuted} />} right={<TextInput.Icon icon={showPass ? 'eye-off' : 'eye'} color={colors.textMuted} onPress={() => setShowPass(!showPass)} />} outlineColor={colors.cardBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} theme={{ colors: { onSurfaceVariant: colors.textMuted } }} />

            {error && <HelperText type="error" visible style={styles.error}>{error}</HelperText>}
            {success && <HelperText type="info" visible style={styles.success}>{success}</HelperText>}

            <View style={styles.btnWrap}>
              <LinearGradient colors={gradients.primary as [string, string, ...string[]]} start={{ x: 0, y: 0 }} end={{ x: 1, y: 0 }} style={styles.gradient}>
                <Button mode="contained" onPress={handleSubmit} loading={loading} disabled={loading} style={styles.btn} contentStyle={styles.btnContent} labelStyle={styles.btnLabel} buttonColor="transparent">
                  {isLogin ? 'Sign In' : 'Sign Up'}
                </Button>
              </LinearGradient>
            </View>

            <Button mode="text" onPress={() => { setIsLogin(!isLogin); setError(null); setSuccess(null); }} labelStyle={styles.switchLabel}>
              {isLogin ? "Don't have an account? Sign Up" : 'Already have an account? Sign In'}
            </Button>
          </GlassCard>
        </ScrollView>
      </KeyboardAvoidingView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  flex: { flex: 1 },
  scroll: { flexGrow: 1, justifyContent: 'center', padding: 20 },
  logoWrap: { alignItems: 'center', marginBottom: 20 },
  logo: { width: 90, height: 90, borderRadius: 45, backgroundColor: colors.card, borderWidth: 2, borderColor: colors.cardBorder, justifyContent: 'center', alignItems: 'center' },
  card: { marginHorizontal: 0 },
  title: { textAlign: 'center', fontSize: 24, fontWeight: 'bold', color: colors.textPrimary, marginBottom: 4 },
  subtitle: { textAlign: 'center', color: colors.textSecondary, marginBottom: 20 },
  input: { marginBottom: 12, backgroundColor: colors.inputBackground },
  error: { color: colors.error },
  success: { color: colors.success },
  btnWrap: { marginTop: 12, borderRadius: 12, overflow: 'hidden' },
  gradient: { borderRadius: 12 },
  btn: { borderRadius: 12 },
  btnContent: { paddingVertical: 6 },
  btnLabel: { color: colors.white, fontSize: 15, fontWeight: '600' },
  switchLabel: { color: colors.textSecondary, marginTop: 12 },
});
