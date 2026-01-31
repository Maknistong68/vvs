import React, { createContext, useContext, useEffect, useState, useCallback } from 'react';
import { Session } from '@supabase/supabase-js';
import { supabase, User, UserRole, Company } from './supabase';

interface AuthContextType {
  session: Session | null;
  user: User | null;
  company: Company | null;
  role: UserRole | null;
  loading: boolean;
  signIn: (email: string, password: string) => Promise<{ error: Error | null }>;
  signUp: (
    email: string,
    password: string,
    fullName: string,
    companyCode?: string
  ) => Promise<{ error: Error | null }>;
  signOut: () => Promise<void>;
  refreshUser: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [session, setSession] = useState<Session | null>(null);
  const [user, setUser] = useState<User | null>(null);
  const [company, setCompany] = useState<Company | null>(null);
  const [loading, setLoading] = useState(true);

  const fetchUserProfile = useCallback(async (userId: string) => {
    const { data, error } = await supabase
      .from('users')
      .select(`
        *,
        company:companies(*)
      `)
      .eq('id', userId)
      .single();

    if (error) {
      console.error('Error fetching user profile:', error);
      return { user: null, company: null };
    }

    return {
      user: data as User,
      company: data.company as Company | null,
    };
  }, []);

  const refreshUser = useCallback(async () => {
    if (session?.user?.id) {
      const { user: profile, company: userCompany } = await fetchUserProfile(session.user.id);
      setUser(profile);
      setCompany(userCompany);
    }
  }, [session?.user?.id, fetchUserProfile]);

  useEffect(() => {
    // Get initial session
    supabase.auth.getSession().then(async ({ data: { session } }) => {
      setSession(session);
      if (session?.user?.id) {
        const { user: profile, company: userCompany } = await fetchUserProfile(session.user.id);
        setUser(profile);
        setCompany(userCompany);
      }
      setLoading(false);
    });

    // Listen for auth changes
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange(async (_event, session) => {
      setSession(session);
      if (session?.user?.id) {
        const { user: profile, company: userCompany } = await fetchUserProfile(session.user.id);
        setUser(profile);
        setCompany(userCompany);
      } else {
        setUser(null);
        setCompany(null);
      }
      setLoading(false);
    });

    return () => subscription.unsubscribe();
  }, [fetchUserProfile]);

  const signIn = async (email: string, password: string) => {
    const { error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });
    return { error: error ? new Error(error.message) : null };
  };

  const signUp = async (
    email: string,
    password: string,
    fullName: string,
    companyCode?: string
  ) => {
    // If company code provided, look up the company first
    let companyId: string | null = null;

    if (companyCode) {
      const { data: companyData, error: companyError } = await supabase
        .from('companies')
        .select('id')
        .eq('code', companyCode.toUpperCase())
        .eq('is_active', true)
        .single();

      if (companyError || !companyData) {
        return { error: new Error('Invalid company code. Please check and try again.') };
      }
      companyId = companyData.id;
    }

    const { error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: {
          full_name: fullName,
          company_id: companyId,
        },
      },
    });
    return { error: error ? new Error(error.message) : null };
  };

  const signOut = async () => {
    await supabase.auth.signOut();
    setUser(null);
    setCompany(null);
    setSession(null);
  };

  const value = {
    session,
    user,
    company,
    role: user?.role ?? null,
    loading,
    signIn,
    signUp,
    signOut,
    refreshUser,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}

// Role-based access helpers
export function useIsOwner() {
  const { role } = useAuth();
  return role === 'owner';
}

export function useIsAdmin() {
  const { role } = useAuth();
  return role === 'admin' || role === 'owner';
}

export function useIsInspector() {
  const { role } = useAuth();
  return role === 'inspector';
}

export function useCanManageUsers() {
  const { role } = useAuth();
  return role === 'owner';
}

export function useCanManageAdmins() {
  const { role } = useAuth();
  return role === 'owner';
}

export function useCanManageVehicles() {
  const { role } = useAuth();
  return role === 'owner' || role === 'admin';
}

export function useCanManageFailureReasons() {
  const { role } = useAuth();
  return role === 'owner' || role === 'admin';
}

export function useCanManageInspections() {
  const { role } = useAuth();
  return role === 'owner' || role === 'admin';
}

export function useCanManageCompanies() {
  const { role } = useAuth();
  return role === 'owner';
}
