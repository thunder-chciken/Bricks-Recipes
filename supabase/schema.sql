-- Bricks Recipes: per-user workspace storage.
-- Run once in Supabase → SQL Editor → New query → Run.

create table if not exists public.user_state (
  user_id    uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  key        text        not null check (key in ('presets','activePreset','swap','favs','recent','custom','cart')),
  value      jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, key)
);

alter table public.user_state enable row level security;

-- Each signed-in user can only see and change their own rows.
drop policy if exists "own rows: select" on public.user_state;
drop policy if exists "own rows: insert" on public.user_state;
drop policy if exists "own rows: update" on public.user_state;
drop policy if exists "own rows: delete" on public.user_state;

create policy "own rows: select" on public.user_state
  for select to authenticated using ((select auth.uid()) = user_id);
create policy "own rows: insert" on public.user_state
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "own rows: update" on public.user_state
  for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "own rows: delete" on public.user_state
  for delete to authenticated using ((select auth.uid()) = user_id);
