create table if not exists public.homework (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null check (char_length(title) between 1 and 160),
  subject text not null check (subject in ('Maths', 'Science', 'Reader')),
  due_at timestamptz,
  remaining_count integer check (remaining_count is null or remaining_count >= 0),
  completed boolean not null default false,
  created_at timestamptz not null default now()
);

alter table public.homework enable row level security;

drop policy if exists "Users can view their own homework" on public.homework;
create policy "Users can view their own homework"
on public.homework for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can add their own homework" on public.homework;
create policy "Users can add their own homework"
on public.homework for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update their own homework" on public.homework;
create policy "Users can update their own homework"
on public.homework for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Users can delete their own homework" on public.homework;
create policy "Users can delete their own homework"
on public.homework for delete
to authenticated
using (auth.uid() = user_id);

create index if not exists homework_user_due_idx
on public.homework (user_id, due_at);
