-- Migration: Add app_settings and audit_logs tables
-- Run this SQL in your Supabase SQL Editor

-- =============================================
-- 1. APP SETTINGS TABLE
-- =============================================
-- Stores app-wide configuration settings per company

CREATE TABLE IF NOT EXISTS app_settings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  company_id UUID REFERENCES companies(id) ON DELETE CASCADE,
  setting_key TEXT NOT NULL,
  setting_value JSONB NOT NULL DEFAULT '{}',
  updated_by UUID REFERENCES users(id) ON DELETE SET NULL,
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(company_id, setting_key)
);

-- Index for faster lookups
CREATE INDEX IF NOT EXISTS idx_app_settings_company_key ON app_settings(company_id, setting_key);

-- Enable RLS
ALTER TABLE app_settings ENABLE ROW LEVEL SECURITY;

-- RLS Policies for app_settings
-- Owners can read all settings for their company
CREATE POLICY "Owners can read company settings" ON app_settings
  FOR SELECT
  USING (
    company_id IS NULL
    OR company_id IN (
      SELECT company_id FROM users WHERE id = auth.uid() AND role = 'owner'
    )
  );

-- Owners can insert settings for their company
CREATE POLICY "Owners can insert settings" ON app_settings
  FOR INSERT
  WITH CHECK (
    company_id IS NULL
    OR company_id IN (
      SELECT company_id FROM users WHERE id = auth.uid() AND role = 'owner'
    )
  );

-- Owners can update settings for their company
CREATE POLICY "Owners can update settings" ON app_settings
  FOR UPDATE
  USING (
    company_id IS NULL
    OR company_id IN (
      SELECT company_id FROM users WHERE id = auth.uid() AND role = 'owner'
    )
  );

-- =============================================
-- 2. AUDIT LOGS TABLE
-- =============================================
-- Tracks all changes to entities for audit trail

CREATE TABLE IF NOT EXISTS audit_logs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  entity_type TEXT NOT NULL,           -- 'vehicle', 'user', 'company', 'settings'
  entity_id UUID NOT NULL,
  action TEXT NOT NULL,                -- 'status_change', 'create', 'update', 'delete'
  field_name TEXT,                     -- 'actual_status', 'is_blacklisted', etc.
  old_value TEXT,
  new_value TEXT,
  changed_by UUID REFERENCES users(id) ON DELETE SET NULL,
  changed_at TIMESTAMPTZ DEFAULT NOW(),
  company_id UUID REFERENCES companies(id) ON DELETE SET NULL,
  metadata JSONB                       -- Additional context (reason, notes, etc.)
);

-- Indexes for efficient queries
CREATE INDEX IF NOT EXISTS idx_audit_entity ON audit_logs(entity_type, entity_id);
CREATE INDEX IF NOT EXISTS idx_audit_company ON audit_logs(company_id);
CREATE INDEX IF NOT EXISTS idx_audit_changed_at ON audit_logs(changed_at DESC);
CREATE INDEX IF NOT EXISTS idx_audit_action ON audit_logs(action);

-- Enable RLS
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;

-- RLS Policies for audit_logs
-- Users can read audit logs for their company
CREATE POLICY "Users can read company audit logs" ON audit_logs
  FOR SELECT
  USING (
    company_id IS NULL
    OR company_id IN (
      SELECT company_id FROM users WHERE id = auth.uid()
    )
  );

-- Any authenticated user can insert audit logs
CREATE POLICY "Authenticated users can create audit logs" ON audit_logs
  FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

-- No updates or deletes on audit logs (immutable)
-- (No UPDATE or DELETE policies = audit logs are append-only)

-- =============================================
-- 3. DEFAULT SETTINGS
-- =============================================
-- Insert default global settings (company_id = NULL for global)

INSERT INTO app_settings (company_id, setting_key, setting_value)
VALUES
  (NULL, 'dashboard_kpis', '["verified", "pending", "rejected", "expired"]'::jsonb),
  (NULL, 'companies_visible_to', '["owner"]'::jsonb),
  (NULL, 'audit_enabled', 'true'::jsonb),
  (NULL, 'audit_retention_days', '365'::jsonb)
ON CONFLICT (company_id, setting_key) DO NOTHING;

-- =============================================
-- 4. HELPER FUNCTION FOR AUDIT LOGGING
-- =============================================
-- Optional: Create a trigger function for automatic audit logging on vehicles

CREATE OR REPLACE FUNCTION log_vehicle_status_change()
RETURNS TRIGGER AS $$
BEGIN
  -- Only log if actual_status changed
  IF OLD.actual_status IS DISTINCT FROM NEW.actual_status THEN
    INSERT INTO audit_logs (
      entity_type,
      entity_id,
      action,
      field_name,
      old_value,
      new_value,
      changed_by,
      company_id,
      metadata
    ) VALUES (
      'vehicle',
      NEW.id,
      'status_change',
      'actual_status',
      OLD.actual_status,
      NEW.actual_status,
      auth.uid(),
      NEW.company_id,
      jsonb_build_object('plate_number', NEW.plate_number)
    );
  END IF;

  -- Log blacklist changes
  IF OLD.is_blacklisted IS DISTINCT FROM NEW.is_blacklisted THEN
    INSERT INTO audit_logs (
      entity_type,
      entity_id,
      action,
      field_name,
      old_value,
      new_value,
      changed_by,
      company_id,
      metadata
    ) VALUES (
      'vehicle',
      NEW.id,
      'status_change',
      'is_blacklisted',
      OLD.is_blacklisted::text,
      NEW.is_blacklisted::text,
      auth.uid(),
      NEW.company_id,
      jsonb_build_object('plate_number', NEW.plate_number)
    );
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger on vehicles_equipment table
DROP TRIGGER IF EXISTS vehicle_audit_trigger ON vehicles_equipment;
CREATE TRIGGER vehicle_audit_trigger
  AFTER UPDATE ON vehicles_equipment
  FOR EACH ROW
  EXECUTE FUNCTION log_vehicle_status_change();

-- Grant permissions
GRANT SELECT, INSERT ON app_settings TO authenticated;
GRANT SELECT, INSERT ON audit_logs TO authenticated;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO authenticated;
