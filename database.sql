-- Create reading_progress table
create table if not exists public.reading_progress (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references auth.users on delete cascade not null,
  comic_id uuid references public.comics on delete cascade not null,
  chapter_id uuid references public.chapters on delete cascade not null,
  current_page integer not null default 0,
  total_pages integer not null,
  is_completed boolean not null default false,
  last_read_at timestamp with time zone default timezone('utc'::text, now()) not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique(user_id, comic_id, chapter_id)
);

-- Enable RLS
alter table public.reading_progress enable row level security;

-- Create policies
create policy "Users can view own reading progress"
on public.reading_progress for select
using (auth.uid() = user_id);

create policy "Users can update own reading progress"
on public.reading_progress for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users can update own reading progress"
on public.reading_progress for update
using (auth.uid() = user_id);

create policy "Users can delete own reading progress"
on public.reading_progress for delete
using (auth.uid() = user_id);