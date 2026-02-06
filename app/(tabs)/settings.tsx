import React, { useState, useEffect } from 'react';
import { View, StyleSheet, Alert, ScrollView, StatusBar } from 'react-native';
import { Text, Button, Avatar, List, Divider, Switch, Chip, ActivityIndicator } from 'react-native-paper';
import { LinearGradient } from 'expo-linear-gradient';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { useRouter } from 'expo-router';
import { useAuth, useIsOwner } from '../../lib/auth';
import { colors, gradients, glass, roleColors } from '../../lib/theme';
import { KpiType, KPI_CONFIG, DEFAULT_DASHBOARD_KPIS, UserRole } from '../../lib/supabase';
import {
  useDashboardKpiSettings,
  useCompaniesVisibilitySettings,
  useAuditSettings,
  useUpdateSetting,
} from '../../lib/hooks/useSettings';
import GlassCard from '../../components/GlassCard';
import GlassBackground from '../../components/GlassBackground';
import { ProfileSkeleton } from '../../components/SkeletonLoader';

// KPI Selection Component
function KpiSelector({
  selectedKpis,
  onToggle,
}: {
  selectedKpis: KpiType[];
  onToggle: (kpi: KpiType) => void;
}) {
  const allKpis: KpiType[] = ['verified', 'pending', 'rejected', 'expired', 'total', 'blacklisted', 'overdue'];

  return (
    <View style={styles.kpiGrid}>
      {allKpis.map((kpi) => {
        const config = KPI_CONFIG[kpi];
        const isSelected = selectedKpis.includes(kpi);
        const isDisabled = isSelected && selectedKpis.length <= 1;

        return (
          <Chip
            key={kpi}
            mode={isSelected ? 'flat' : 'outlined'}
            selected={isSelected}
            onPress={() => !isDisabled && onToggle(kpi)}
            style={[
              styles.kpiChip,
              isSelected && { backgroundColor: `${config.color}20` },
            ]}
            textStyle={[
              styles.kpiChipText,
              isSelected && { color: config.color },
            ]}
            icon={() => (
              <MaterialCommunityIcons
                name={config.icon as any}
                size={16}
                color={isSelected ? config.color : colors.textMuted}
              />
            )}
            disabled={isDisabled}
          >
            {config.label}
          </Chip>
        );
      })}
    </View>
  );
}

// Role Access Selector Component
function RoleAccessSelector({
  selectedRoles,
  onToggle,
}: {
  selectedRoles: string[];
  onToggle: (role: string) => void;
}) {
  const roles: { value: UserRole; label: string; icon: string }[] = [
    { value: 'owner', label: 'Owner', icon: 'crown' },
    { value: 'admin', label: 'Admin', icon: 'shield-account' },
    { value: 'inspector', label: 'Inspector', icon: 'account-check' },
  ];

  return (
    <View style={styles.roleGrid}>
      {roles.map((role) => {
        const isSelected = selectedRoles.includes(role.value);
        const roleColor = roleColors[role.value];
        // Owner always has access
        const isOwnerRole = role.value === 'owner';

        return (
          <Chip
            key={role.value}
            mode={isSelected ? 'flat' : 'outlined'}
            selected={isSelected}
            onPress={() => !isOwnerRole && onToggle(role.value)}
            style={[
              styles.roleChip,
              isSelected && { backgroundColor: `${roleColor}20` },
            ]}
            textStyle={[
              styles.roleChipText,
              isSelected && { color: roleColor },
            ]}
            icon={() => (
              <MaterialCommunityIcons
                name={role.icon as any}
                size={16}
                color={isSelected ? roleColor : colors.textMuted}
              />
            )}
            disabled={isOwnerRole}
          >
            {role.label}
          </Chip>
        );
      })}
    </View>
  );
}

export default function SettingsScreen() {
  const router = useRouter();
  const { user, company, signOut } = useAuth();
  const { isOwner } = useIsOwner();
  const insets = useSafeAreaInsets();

  // Settings queries (only for owners)
  const { data: dashboardKpis, isLoading: kpisLoading } = useDashboardKpiSettings(company?.id);
  const { data: companiesVisibility, isLoading: visibilityLoading } = useCompaniesVisibilitySettings(company?.id);
  const { data: auditEnabled, isLoading: auditLoading } = useAuditSettings(company?.id);
  const updateSetting = useUpdateSetting();

  // Local state for settings
  const [localKpis, setLocalKpis] = useState<KpiType[]>(DEFAULT_DASHBOARD_KPIS);
  const [localVisibility, setLocalVisibility] = useState<string[]>(['owner']);
  const [localAuditEnabled, setLocalAuditEnabled] = useState(true);

  // Sync local state with fetched data
  useEffect(() => {
    if (dashboardKpis) setLocalKpis(dashboardKpis);
  }, [dashboardKpis]);

  useEffect(() => {
    if (companiesVisibility) setLocalVisibility(companiesVisibility);
  }, [companiesVisibility]);

  useEffect(() => {
    if (auditEnabled !== undefined) setLocalAuditEnabled(auditEnabled);
  }, [auditEnabled]);

  const handleLogout = () => {
    Alert.alert('Logout', 'Are you sure?', [
      { text: 'Cancel', style: 'cancel' },
      { text: 'Logout', style: 'destructive', onPress: async () => { await signOut(); router.replace('/(auth)/login'); } },
    ]);
  };

  const getRoleColor = (role: string) => roleColors[role] || colors.success;

  const getRoleIcon = (role: string) => {
    switch (role) {
      case 'owner': return 'crown';
      case 'admin': return 'shield-account';
      case 'contractor': return 'briefcase-account';
      default: return 'account-check';
    }
  };

  const displayName = user?.full_name && !user.full_name.includes('@') ? user.full_name : user?.email?.split('@')[0] || 'User';

  // Handler for toggling KPIs
  const handleKpiToggle = (kpi: KpiType) => {
    let newKpis: KpiType[];
    if (localKpis.includes(kpi)) {
      newKpis = localKpis.filter((k) => k !== kpi);
    } else {
      // Limit to 4 KPIs
      if (localKpis.length >= 4) {
        newKpis = [...localKpis.slice(1), kpi];
      } else {
        newKpis = [...localKpis, kpi];
      }
    }
    setLocalKpis(newKpis);
    if (user?.id) {
      updateSetting.mutate({
        key: 'dashboard_kpis',
        value: newKpis,
        userId: user.id,
        companyId: company?.id,
      });
    }
  };

  // Handler for toggling role visibility
  const handleRoleToggle = (role: string) => {
    let newRoles: string[];
    if (localVisibility.includes(role)) {
      newRoles = localVisibility.filter((r) => r !== role);
    } else {
      newRoles = [...localVisibility, role];
    }
    // Ensure owner always has access
    if (!newRoles.includes('owner')) {
      newRoles = ['owner', ...newRoles];
    }
    setLocalVisibility(newRoles);
    if (user?.id) {
      updateSetting.mutate({
        key: 'companies_visible_to',
        value: newRoles,
        userId: user.id,
        companyId: company?.id,
      });
    }
  };

  // Handler for toggling audit
  const handleAuditToggle = (enabled: boolean) => {
    setLocalAuditEnabled(enabled);
    if (user?.id) {
      updateSetting.mutate({
        key: 'audit_enabled',
        value: enabled,
        userId: user.id,
        companyId: company?.id,
      });
    }
  };

  const settingsLoading = kpisLoading || visibilityLoading || auditLoading;

  // W11: Show ProfileSkeleton while auth data is loading
  if (!user) {
    return (
      <GlassBackground>
        <ProfileSkeleton />
      </GlassBackground>
    );
  }

  return (
    <GlassBackground>
      <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
      <ScrollView contentContainerStyle={styles.content} showsVerticalScrollIndicator={false}>
        <View style={[styles.header, { paddingTop: insets.top + 16 }]}>
          <Text style={styles.title}>Profile</Text>
        </View>

        {/* Profile Card */}
        <GlassCard elevated style={styles.profileCard} padding={24}>
          <View style={styles.profileContent}>
            <View style={[styles.avatarContainer, { borderColor: getRoleColor(user?.role || 'inspector') }]}>
              <Avatar.Icon
                size={72}
                icon={getRoleIcon(user?.role || 'inspector')}
                style={[styles.avatar, { backgroundColor: getRoleColor(user?.role || 'inspector') }]}
                color={colors.white}
              />
            </View>
            <Text style={styles.name}>{displayName}</Text>
            <Text style={styles.email}>{user?.email || ''}</Text>
            <View style={[styles.roleBadge, { backgroundColor: `${getRoleColor(user?.role || 'inspector')}20` }]}>
              <MaterialCommunityIcons
                name={getRoleIcon(user?.role || 'inspector')}
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
              <List.Item
                title="Name"
                description={company.name}
                titleStyle={styles.listTitle}
                descriptionStyle={styles.listDesc}
                left={(props) => <List.Icon {...props} icon="domain" color={colors.primary} />}
              />
              <Divider style={styles.divider} />
              <List.Item
                title="Code"
                description={company.code}
                titleStyle={styles.listTitle}
                descriptionStyle={styles.listDesc}
                left={(props) => <List.Icon {...props} icon="identifier" color={colors.primary} />}
              />
              {company.contact_email && (
                <>
                  <Divider style={styles.divider} />
                  <List.Item
                    title="Email"
                    description={company.contact_email}
                    titleStyle={styles.listTitle}
                    descriptionStyle={styles.listDesc}
                    left={(props) => <List.Icon {...props} icon="email" color={colors.primary} />}
                  />
                </>
              )}
            </List.Section>
          </GlassCard>
        )}

        {/* Account Info */}
        <GlassCard style={styles.infoCard} padding={0}>
          <List.Section>
            <List.Subheader style={styles.sectionHeader}>ACCOUNT</List.Subheader>
            <List.Item
              title="Email"
              description={user?.email || 'N/A'}
              titleStyle={styles.listTitle}
              descriptionStyle={styles.listDesc}
              left={(props) => <List.Icon {...props} icon="email" color={colors.primary} />}
            />
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

        {/* Owner Control Panel */}
        {isOwner && (
          <GlassCard style={styles.infoCard} padding={0}>
            <List.Section>
              <List.Subheader style={styles.sectionHeader}>
                <View style={styles.sectionHeaderRow}>
                  <MaterialCommunityIcons name="crown" size={14} color={roleColors.owner} />
                  <Text style={[styles.sectionHeaderText, { color: roleColors.owner }]}>OWNER SETTINGS</Text>
                </View>
              </List.Subheader>

              {settingsLoading ? (
                <View style={styles.loadingContainer}>
                  <ActivityIndicator size="small" color={colors.primary} />
                </View>
              ) : (
                <>
                  {/* Dashboard KPI Settings */}
                  <View style={styles.settingSection}>
                    <View style={styles.settingHeader}>
                      <MaterialCommunityIcons name="view-dashboard" size={20} color={colors.primary} />
                      <View style={styles.settingHeaderText}>
                        <Text style={styles.settingTitle}>Dashboard KPIs</Text>
                        <Text style={styles.settingDesc}>Choose which 4 KPIs to display</Text>
                      </View>
                    </View>
                    <KpiSelector selectedKpis={localKpis} onToggle={handleKpiToggle} />
                  </View>

                  <Divider style={styles.divider} />

                  {/* Access Control Settings */}
                  <View style={styles.settingSection}>
                    <View style={styles.settingHeader}>
                      <MaterialCommunityIcons name="shield-account" size={20} color={colors.primary} />
                      <View style={styles.settingHeaderText}>
                        <Text style={styles.settingTitle}>Companies Access</Text>
                        <Text style={styles.settingDesc}>Who can view company list</Text>
                      </View>
                    </View>
                    <RoleAccessSelector selectedRoles={localVisibility} onToggle={handleRoleToggle} />
                  </View>

                  <Divider style={styles.divider} />

                  {/* Audit Settings */}
                  <View style={styles.settingSection}>
                    <View style={styles.settingRow}>
                      <View style={styles.settingHeader}>
                        <MaterialCommunityIcons name="history" size={20} color={colors.primary} />
                        <View style={styles.settingHeaderText}>
                          <Text style={styles.settingTitle}>Audit Trail</Text>
                          <Text style={styles.settingDesc}>Log all status changes</Text>
                        </View>
                      </View>
                      <Switch
                        value={localAuditEnabled}
                        onValueChange={handleAuditToggle}
                        color={colors.primary}
                      />
                    </View>
                  </View>
                </>
              )}
            </List.Section>
          </GlassCard>
        )}

        {/* App Info */}
        <GlassCard style={styles.infoCard} padding={0}>
          <List.Section>
            <List.Subheader style={styles.sectionHeader}>ABOUT</List.Subheader>
            <List.Item
              title="App Version"
              description="2.0.0"
              titleStyle={styles.listTitle}
              descriptionStyle={styles.listDesc}
              left={(props) => <List.Icon {...props} icon="information" color={colors.primary} />}
            />
            <Divider style={styles.divider} />
            <List.Item
              title="VVS Inspection"
              description="Vehicle Verification System"
              titleStyle={styles.listTitle}
              descriptionStyle={styles.listDesc}
              left={(props) => <List.Icon {...props} icon="car-multiple" color={colors.primary} />}
            />
          </List.Section>
        </GlassCard>

        {/* Logout */}
        <View style={styles.logoutContainer}>
          <LinearGradient
            colors={gradients.error as [string, string, ...string[]]}
            start={{ x: 0, y: 0 }}
            end={{ x: 1, y: 0 }}
            style={styles.gradientBtn}
          >
            <Button
              mode="contained"
              onPress={handleLogout}
              style={styles.logoutBtn}
              contentStyle={styles.logoutContent}
              labelStyle={styles.logoutLabel}
              buttonColor="transparent"
              icon="logout"
            >
              Logout
            </Button>
          </LinearGradient>
        </View>

        <View style={{ height: 100 }} />
      </ScrollView>
    </GlassBackground>
  );
}

const styles = StyleSheet.create({
  content: { paddingHorizontal: 16 },
  header: { paddingBottom: 12 },
  title: { color: colors.textPrimary, fontSize: 26, fontWeight: 'bold' },
  profileCard: { marginHorizontal: 0, marginBottom: 16 },
  profileContent: { alignItems: 'center' },
  avatarContainer: {
    borderWidth: 3,
    borderRadius: 42,
    padding: 3,
    marginBottom: 12,
  },
  avatar: { },
  name: { color: colors.textPrimary, fontSize: 22, fontWeight: 'bold', marginBottom: 4 },
  email: { color: colors.textSecondary, fontSize: 14, marginBottom: 12 },
  roleBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 14,
    paddingVertical: 6,
    borderRadius: 16,
    gap: 6
  },
  roleText: { fontWeight: '600', fontSize: 13 },
  infoCard: { marginHorizontal: 0, marginBottom: 16 },
  sectionHeader: { color: colors.textMuted, fontSize: 11, fontWeight: '600', letterSpacing: 1 },
  sectionHeaderRow: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  sectionHeaderText: { fontSize: 11, fontWeight: '600', letterSpacing: 1 },
  listTitle: { color: colors.textSecondary, fontSize: 12 },
  listDesc: { color: colors.textPrimary, fontSize: 14 },
  divider: { backgroundColor: glass.border.color },
  logoutContainer: { marginTop: 8, borderRadius: glass.border.radius.md, overflow: 'hidden' },
  gradientBtn: { borderRadius: glass.border.radius.md },
  logoutBtn: { borderRadius: glass.border.radius.md },
  logoutContent: { paddingVertical: 6 },
  logoutLabel: { color: colors.white, fontSize: 15, fontWeight: '600' },
  // Owner settings styles
  loadingContainer: { padding: 20, alignItems: 'center' },
  settingSection: { padding: 16 },
  settingHeader: { flexDirection: 'row', alignItems: 'flex-start', gap: 12, marginBottom: 12 },
  settingHeaderText: { flex: 1 },
  settingTitle: { color: colors.textPrimary, fontSize: 14, fontWeight: '600' },
  settingDesc: { color: colors.textMuted, fontSize: 12, marginTop: 2 },
  settingRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' },
  kpiGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  kpiChip: { marginBottom: 4 },
  kpiChipText: { fontSize: 12 },
  roleGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  roleChip: { marginBottom: 4 },
  roleChipText: { fontSize: 12 },
});
