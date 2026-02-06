import React, { createContext, useContext, useEffect, useState, useCallback, useMemo, useRef } from 'react';
import { Session } from '@supabase/supabase-js';
import { supabase, User, UserRole, Company } from './supabase';
import { AUTH_TIMEOUT_MS, getErrorMessage } from './constants';

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
    try {
      // First fetch user
      const { data: userData, error: userError } = await supabase
        .from('users')
        .select('*')
        .eq('id', userId)
        .single();

      if (userError) {
        // User profile fetch failed - likely new user or RLS issue
        return { user: null, company: null };
      }

      // Then fetch company if user has one
      let companyData = null;
      if (userData?.company_id) {
        const { data: compData } = await supabase
          .from('companies')
          .select('*')
          .eq('id', userData.company_id)
          .single();
        companyData = compData;
      }

      return {
        user: userData as User,
        company: companyData as Company | null,
      };
    } catch {
      // Unexpected error fetching profile
      return { user: null, company: null };
    }
  }, []);

  const refreshUser = useCallback(async () => {
    if (session?.user?.id) {
      const { user: profile, company: userCompany } = await fetchUserProfile(session.user.id);
      setUser(profile);
      setCompany(userCompany);
    }
  }, [session?.user?.id, fetchUserProfile]);

  // Guard to prevent double profile fetch on initial load (W4)
  const profileFetchedRef = useRef(false);

  useEffect(() => {
    let isMounted = true;
    profileFetchedRef.current = false;

    // Timeout fallback in case getSession hangs (W2: reduced to 2000ms)
    const timeout = setTimeout(() => {
      if (isMounted) {
        setLoading(false);
      }
    }, AUTH_TIMEOUT_MS);

    // Get initial session
    supabase.auth.getSession().then(async ({ data: { session } }) => {
      clearTimeout(timeout);
      if (!isMounted) return;

      setSession(session);
      if (session?.user?.id) {
        const { user: profile, company: userCompany } = await fetchUserProfile(session.user.id);
        if (isMounted) {
          setUser(profile);
          setCompany(userCompany);
          profileFetchedRef.current = true;
        }
      }
      if (isMounted) setLoading(false);
    }).catch(() => {
      clearTimeout(timeout);
      if (isMounted) setLoading(false);
    });

    // Listen for auth changes
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange(async (event, session) => {
      if (!isMounted) return;

      // Skip duplicate fetch on INITIAL_SESSION if profile already loaded (W4)
      if (event === 'INITIAL_SESSION' && profileFetchedRef.current) {
        return;
      }

      setSession(session);
      if (session?.user?.id) {
        const { user: profile, company: userCompany } = await fetchUserProfile(session.user.id);
        if (isMounted) {
          setUser(profile);
          setCompany(userCompany);
          profileFetchedRef.current = true;
        }
      } else {
        setUser(null);
        setCompany(null);
        profileFetchedRef.current = false;
      }
      setLoading(false);
    });

    return () => {
      isMounted = false;
      clearTimeout(timeout);
      subscription.unsubscribe();
    };
  }, [fetchUserProfile]);

  const signIn = async (email: string, password: string) => {
    try {
      const { error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });
      return { error: error ? new Error(error.message) : null };
    } catch (err) {
      return { error: new Error(getErrorMessage(err, 'Sign in failed')) };
    }
  };

  const signUp = async (
    email: string,
    password: string,
    fullName: string,
    companyCode?: string
  ) => {
    try {
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
    } catch (err) {
      return { error: new Error(getErrorMessage(err, 'Sign up failed')) };
    }
  };

  const signOut = async () => {
    await supabase.auth.signOut();
    setUser(null);
    setCompany(null);
    setSession(null);
  };

  // Memoize context value to prevent unnecessary re-renders of consumers
  const value = useMemo(
    () => ({
      session,
      user,
      company,
      role: user?.role ?? null,
      loading,
      signIn,
      signUp,
      signOut,
      refreshUser,
    }),
    [session, user, company, loading, signIn, signUp, signOut, refreshUser]
  );

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
  const { role, loading } = useAuth();
  return { isOwner: role === 'owner', loading };
}

export function useIsAdmin() {
  const { role, loading } = useAuth();
  return { isAdmin: role === 'admin' || role === 'owner', loading };
}

export function useIsInspector() {
  const { role, loading } = useAuth();
  return { isInspector: role === 'inspector', loading };
}

export function useIsContractor() {
  const { role, loading } = useAuth();
  return { isContractor: role === 'contractor', loading };
}

// Legacy boolean-only versions for backward compatibility
export function useIsOwnerBool() {
  const { role } = useAuth();
  return role === 'owner';
}

export function useIsAdminBool() {
  const { role } = useAuth();
  return role === 'admin' || role === 'owner';
}

export function useIsInspectorBool() {
  const { role } = useAuth();
  return role === 'inspector';
}

export function useIsContractorBool() {
  const { role } = useAuth();
  return role === 'contractor';
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

export function useCanAddVehicles() {
  const { role, loading } = useAuth();
  // Inspectors, admins, and owners can add vehicles during inspection
  const canAdd = role === 'inspector' || role === 'admin' || role === 'owner';
  return { canAddVehicles: canAdd, loading };
}
