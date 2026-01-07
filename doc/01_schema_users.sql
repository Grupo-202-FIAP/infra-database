-- Run in the target database (DB_NAME used by the Lambdas).

-- Optional: create DB if you want a dedicated one (uncomment and adjust owner)
-- CREATE DATABASE pos_db WITH OWNER = postgres ENCODING = 'UTF8';

-- UUID generation extension (preferred)
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Extension useful for ILIKE performance (optional)
-- CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Customers table
CREATE TABLE IF NOT EXISTS public.customers (
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cognito_user_id  TEXT        NOT NULL,
    cpf              TEXT,
    email            TEXT        NOT NULL,
    name             TEXT,
    status           TEXT,
    created_at       TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Uniqueness and lookup indexes
CREATE UNIQUE INDEX IF NOT EXISTS ux_customers_cognito_user_id ON public.customers (cognito_user_id);
CREATE UNIQUE INDEX IF NOT EXISTS ux_customers_email           ON public.customers (email);
CREATE UNIQUE INDEX IF NOT EXISTS ux_customers_cpf             ON public.customers (cpf);
CREATE INDEX IF NOT EXISTS ix_customers_status                 ON public.customers (status);
CREATE INDEX IF NOT EXISTS ix_customers_email_lower            ON public.customers ((lower(email)));
CREATE INDEX IF NOT EXISTS ix_customers_created_at             ON public.customers (created_at DESC);

-- Internal users table
CREATE TABLE IF NOT EXISTS public.internal_users (
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cognito_user_id  TEXT        NOT NULL,
    email            TEXT        NOT NULL,
    name             TEXT,
    created_at       TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Uniqueness and lookup indexes
CREATE UNIQUE INDEX IF NOT EXISTS ux_internal_users_cognito_user_id ON public.internal_users (cognito_user_id);
CREATE UNIQUE INDEX IF NOT EXISTS ux_internal_users_email           ON public.internal_users (email);
CREATE INDEX IF NOT EXISTS ix_internal_users_email_lower            ON public.internal_users ((lower(email)));
CREATE INDEX IF NOT EXISTS ix_internal_users_created_at             ON public.internal_users (created_at DESC);

-- Optional trigger to auto-update updated_at (customers)
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_proc WHERE proname = 'set_updated_at'
    ) THEN
        CREATE OR REPLACE FUNCTION set_updated_at()
        RETURNS TRIGGER AS $$
        BEGIN
            NEW.updated_at := NOW();
            RETURN NEW;
        END;
        $$ LANGUAGE plpgsql;
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_trigger WHERE tgname = 'trg_customers_set_updated_at'
    ) THEN
        CREATE TRIGGER trg_customers_set_updated_at
        BEFORE UPDATE ON public.customers
        FOR EACH ROW EXECUTE FUNCTION set_updated_at();
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_trigger WHERE tgname = 'trg_internal_users_set_updated_at'
    ) THEN
        CREATE TRIGGER trg_internal_users_set_updated_at
        BEFORE UPDATE ON public.internal_users
        FOR EACH ROW EXECUTE FUNCTION set_updated_at();
    END IF;
END$$;
