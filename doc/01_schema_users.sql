-- Run in the target database (DB_NAME used by the Lambdas).

-- UUID generation extension
CREATE EXTENSION IF NOT EXISTS pgcrypto;

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
