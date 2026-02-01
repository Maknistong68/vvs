import React from 'react';
import { View, StyleSheet, Alert, ScrollView, StatusBar } from 'react-native';
import { Text, Button, Avatar, List, Divider } from 'react-native-paper';
import { LinearGradient } from 'expo-linear-gradient';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { useRouter } from 'expo-router';
import { useAuth } from '../../lib/auth';
import { colors, gradients } from '../../lib/theme';
import GlassCard from '../../components/GlassCard';

export default function SettingsScreen() {
  const router = useRouter();
  const { user, company, signOut } = useAuth();

  const handleLogout = () => {
    Alert.alert('Logout', 'Are you sure?', [
      { text: 'Cancel', style: 'cancel' },
      { text: 'Logout', style: 'destructive', onPress: async () => { await signOut(); router.replace('/(auth)/login'); } },
    ]);
  };

  const getRoleColor = (role: string) => {
    switch (role) {
      case 'owner': return colors.warning;
      case 'admin': return colors.primary;
      default: return colors.success;
    }
  };

  const displayName = user?.full_name && !user.full_name.includes('@') ? user.full_name : user?.email?.split('@')[0] || 'User';

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor={colors.background} />
      <ScrollView contentContainerStyle={styles.content} showsVerticalScrollIndicator={false}>
        <View style={styles.header}>
          <Text style={styles.title}>Profile</Text>
        </View>

        {/* Profile Card */}
        <GlassCard elevated style={styles.profileCard} padding={24}>
          <View style={styles.profileContent}>
            <Avatar.Icon
              size={72}
              icon="account"
              style={[styles.avatar, { backgroundColor: getRoleColor(user?.role || 'inspector') }]}
              color={colors.white}
            />
            <Text style={styles.name}>{displayName}</Text>
            <Text style={styles.email}>{user?.email || ''}</Text>
            <View style={[styles.roleBadge, { backgroundColor: `${getRoleColor(user?.role || 'inspector')}20` }]}>
              <MaterialCommunityIcons
                name={user?.role === 'owner' ? 'crown' : user?.role === 'admin' ? 'shield-account' : 'account'}
                size={14}
                color={getRoleColor(user?.role || 'inspector')}
              />
              <Text style={[styles.roleText, { color: getRoleColor(user?.role || 'inspector') }]}>
                {(user?.role || 'inspector').charAt(0).toUpperCase() + (user?.role || 'inspector').slice(1)}
              </Text>
            </View>
          </View>
        </GlassCard>

        {/* Company Info */}
        {company && (
          <GlassCard style={styles.infoCard} padding={0}>
            <List.Section>
              <List.Subheader style={styles.sectionHeader}>COMPANY</List.Subheader>
              <List.Item title="Name" description={company.name} titleStyle={styles.listTitle} descriptionStyle={styles.listDesc} left={(props) => <List.Icon {...props} icon="domain" color={colors.primary} />} />
              <Divider style={styles.divider} />
              <List.Item title="Code" description={company.code} titleStyle={styles.listTitle} descriptionStyle={styles.listDesc} left={(props) => <List.Icon {...props} icon="identifier" color={colors.primary} />} />
              {company.contact_email && (
                <>
                  <Divider style={styles.divider} />
                  <List.Item title="Email" description={company.contact_email} titleStyle={styles.listTitle} descriptionStyle={styles.listDesc} left={(props) => <List.Icon {...props} icon="email" color={colors.primary} />} />
                </>
              )}
            </List.Section>
          </GlassCard>
        )}

        {/* Account Info */}
        <GlassCard style={styles.infoCard} padding={0}>
          <List.Section>
            <List.Subheader style={styles.sectionHeader}>ACCOUNT</List.Subheader>
            <List.Item title="Email" description={user?.email || 'N/A'} titleStyle={styles.listTitle} descriptionStyle={styles.listDesc} left={(props) => <List.Icon {...props} icon="email" color={colors.primary} />} />
            <Divider style={styles.divider} />
            <List.Item
              title="Member Since"
              description={user?.created_at ? new Date(user.created_at).toLocaleDateString() : 'N/A'}
              titleStyle={styles.listTitle}
              descriptionStyle={styles.listDesc}
              left={(props) => <List.Icon {...props} icon="calendar" color={colors.primary} />}
            />
          </List.Section>
        </GlassCard>

        {/* App Info */}
        <GlassCard style={styles.infoCard} padding={0}>
          <List.Section>
            <List.Subheader style={styles.sectionHeader}>ABOUT</List.Subheader>
            <List.Item title="App Version" description="2.0.0" titleStyle={styles.listTitle} descriptionStyle={styles.listDesc} left={(props) => <List.Icon {...props} icon="information" color={colors.primary} />} />
            <Divider style={styles.divider} />
            <List.Item title="VVS Inspection" description="Vehicle Verification System" titleStyle={styles.listTitle} descriptionStyle={styles.listDesc} left={(props) => <List.Icon {...props} icon="car-multiple" color={colors.primary} />} />
          </List.Section>
        </GlassCard>

        {/* Logout */}
        <View style={styles.logoutContainer}>
          <LinearGradient colors={gradients.error as [string, string, ...string[]]} start={{ x: 0, y: 0 }} end={{ x: 1, y: 0 }} style={styles.gradientBtn}>
            <Button mode="contained" onPress={handleLogout} style={styles.logoutBtn} contentStyle={styles.logoutContent} labelStyle={styles.logoutLabel} buttonColor="transparent" icon="logout">
              Logout
            </Button>
          </LinearGradient>
        </View>

        <View style={{ height: 100 }} />
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  content: { paddingHorizontal: 16 },
  header: { paddingTop: 50, paddingBottom: 12 },
  title: { color: colors.textPrimary, fontSize: 24, fontWeight: 'bold' },
  profileCard: { marginHorizontal: 0, marginBottom: 16 },
  profileContent: { alignItems: 'center' },
  avatar: { marginBottom: 12 },
  name: { color: colors.textPrimary, fontSize: 20, fontWeight: 'bold', marginBottom: 4 },
  email: { color: colors.textSecondary, fontSize: 14, marginBottom: 12 },
  roleBadge: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 14, paddingVertical: 6, borderRadius: 16, gap: 6 },
  roleText: { fontWeight: '600', fontSize: 13 },
  infoCard: { marginHorizontal: 0, marginBottom: 16 },
  sectionHeader: { color: colors.textMuted, fontSize: 11, fontWeight: '600', letterSpacing: 1 },
  listTitle: { color: colors.textSecondary, fontSize: 12 },
  listDesc: { color: colors.textPrimary, fontSize: 14 },
  divider: { backgroundColor: colors.cardBorder },
  logoutContainer: { marginTop: 8, borderRadius: 12, overflow: 'hidden' },
  gradientBtn: { borderRadius: 12 },
  logoutBtn: { borderRadius: 12 },
  logoutContent: { paddingVertical: 6 },
  logoutLabel: { color: colors.white, fontSize: 15, fontWeight: '600' },
});
