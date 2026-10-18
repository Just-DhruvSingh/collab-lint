-- Apply in a Supabase project after configuring authenticated membership checks.
create table if not exists societies (id uuid primary key default gen_random_uuid(), name text not null, created_at timestamptz not null default now());
create table if not exists collaboration_proposals (id uuid primary key default gen_random_uuid(), owner_society_id uuid references societies(id), partner_society_id uuid references societies(id), status text not null check (status in ('draft','active','declined','expired','confirmed')), current_version integer not null default 1, created_at timestamptz not null default now());
create table if not exists proposal_versions (id uuid primary key default gen_random_uuid(), proposal_id uuid not null references collaboration_proposals(id) on delete cascade, version integer not null, terms jsonb not null, feasibility jsonb not null, created_at timestamptz not null default now(), unique(proposal_id,version));
create table if not exists agreement_approvals (id uuid primary key default gen_random_uuid(), proposal_version_id uuid not null references proposal_versions(id) on delete cascade, society_id uuid not null references societies(id), approved_at timestamptz not null default now(), unique(proposal_version_id,society_id));
create table if not exists agreements (id uuid primary key default gen_random_uuid(), proposal_id uuid not null unique references collaboration_proposals(id), proposal_version_id uuid not null unique references proposal_versions(id), confirmed_at timestamptz not null default now());
-- Enable RLS before exposing these tables. Add policies tied to verified society membership;
-- do not use client-supplied society IDs as authorization.
alter table societies enable row level security;
alter table collaboration_proposals enable row level security;
alter table proposal_versions enable row level security;
alter table agreement_approvals enable row level security;
alter table agreements enable row level security;
