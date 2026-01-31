import React from 'react';
import { View, StyleSheet, Alert } from 'react-native';
import { Text, Card, Button, Avatar, Divider, List } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { useRouter } from 'expo-router';
import { useAuth } from '../../lib/auth';

export default function SettingsScreen() {
  const router = useRouter();
  const { user, company, signOut } = useAuth();

  const handleLogout = () => {
    Alert.alert('Confirm Logout', 'Are you sure you want to log out?', [
      { text: 'Cancel', style: 'cancel' },
      {
        text: 'Logout',
        style: 'destructive',
        onPress: async () => {
          await signOut();
          router.replace('/(auth)/login');
        },
      },
    ]);
  };

  const getRoleColor = (role: string) => {
    switch (role) {
      case 'owner':
        return '#FF9800';
      case 'admin':
        return '#6200EE';
      default:
        return '#4CAF50';
    }
  };

  const getRoleIcon = (role: string) => {
    switch (role) {
      case 'owner':
        return 'crown';
      case 'admin':
        return 'shield-account';
      default:
        return 'clipboard-check';
    }
  };

  return (
    <View style={styles.container}>
      {/* Profile Card */}
      <Card style={styles.profileCard}>
        <Card.Content style={styles.profileContent}>
          <Avatar.Icon
            size={80}
            icon="account"
            style={[styles.avatar, { backgroundColor: getRoleColor(user?.role || 'inspector') }]}
          />
          <Text variant="headlineSmall" style={styles.name}>
            {user?.full_name || 'User'}
          </Text>
          <Text variant="bodyMedium" style={styles.email}>
            {user?.email || 'No email'}
          </Text>
          <View style={styles.roleBadge}>
            <MaterialCommunityIcons
              name={getRoleIcon(user?.role || 'inspector')}
              size={16}
              color={getRoleColor(user?.role || 'inspector')}
            />
            <Text style={[styles.roleText, { color: getRoleColor(user?.role || 'inspector') }]}>
              {(user?.role || 'inspector').charAt(0).toUpperCase() +
                (user?.role || 'inspector').slice(1)}
            </Text>
          </View>
        </Card.Content>
      </Card>

      {/* Company Info */}
      {company && (
        <Card style={styles.infoCard}>
          <List.Section>
            <List.Subheader>Company Information</List.Subheader>
            <List.Item
              title="Company Name"
              description={company.name}
              left={(props) => <List.Icon {...props} icon="domain" />}
            />
            <Divider />
            <List.Item
              title="Company Code"
              description={company.code}
              left={(props) => <List.Icon {...props} icon="identifier" />}
            />
            {company.contact_email && (
              <>
                <Divider />
                <List.Item
                  title="Contact Email"
                  description={company.contact_email}
                  left={(props) => <List.Icon {...props} icon="email" />}
                />
              </>
            )}
            {company.contact_phone && (
              <>
                <Divider />
                <List.Item
                  title="Contact Phone"
                  description={company.contact_phone}
                  left={(props) => <List.Icon {...props} icon="phone" />}
                />
              </>
            )}
            {company.address && (
              <>
                <Divider />
                <List.Item
                  title="Address"
                  description={company.address}
                  left={(props) => <List.Icon {...props} icon="map-marker" />}
                />
              </>
            )}
          </List.Section>
        </Card>
      )}

      {/* Account Info */}
      <Card style={styles.infoCard}>
        <List.Section>
          <List.Subheader>Account Information</List.Subheader>
          <List.Item
            title="Full Name"
            description={user?.full_name || 'Not set'}
            left={(props) => <List.Icon {...props} icon="account" />}
          />
          <Divider />
          <List.Item
            title="Email"
            description={user?.email || 'Not set'}
            left={(props) => <List.Icon {...props} icon="email" />}
          />
          <Divider />
          <List.Item
            title="Role"
            description={
              (user?.role || 'inspector').charAt(0).toUpperCase() +
              (user?.role || 'inspector').slice(1)
            }
            left={(props) => (
              <List.Icon
                {...props}
                icon={getRoleIcon(user?.role || 'inspector')}
                color={getRoleColor(user?.role || 'inspector')}
              />
            )}
          />
          <Divider />
          <List.Item
            title="Member Since"
            description={user?.created_at ? new Date(user.created_at).toLocaleDateString() : 'Unknown'}
            left={(props) => <List.Icon {...props} icon="calendar" />}
          />
        </List.Section>
      </Card>

      {/* App Info */}
      <Card style={styles.infoCard}>
        <List.Section>
          <List.Subheader>About</List.Subheader>
          <List.Item
            title="App Version"
            description="1.0.0"
            left={(props) => <List.Icon {...props} icon="information" />}
          />
          <Divider />
          <List.Item
            title="VVS Inspection System"
            description="Multi-Company Vehicle Verification System"
            left={(props) => <List.Icon {...props} icon="car-multiple" />}
          />
        </List.Section>
      </Card>

      {/* Logout Button */}
      <Button mode="contained" onPress={handleLogout} style={styles.logoutButton} buttonColor="#F44336" icon="logout">
        Logout
      </Button>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    padding: 16,
  },
  profileCard: {
    marginBottom: 16,
    backgroundColor: '#FFFFFF',
  },
  profileContent: {
    alignItems: 'center',
    paddingVertical: 24,
  },
  avatar: {
    marginBottom: 16,
  },
  name: {
    fontWeight: 'bold',
    marginBottom: 4,
  },
  email: {
    color: '#666',
    marginBottom: 12,
  },
  roleBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderRadius: 20,
  },
  roleText: {
    marginLeft: 8,
    fontWeight: '600',
  },
  infoCard: {
    marginBottom: 16,
    backgroundColor: '#FFFFFF',
  },
  logoutButton: {
    marginTop: 8,
    paddingVertical: 4,
  },
});
