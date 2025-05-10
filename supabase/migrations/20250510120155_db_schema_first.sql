create table "public"."competitions" (
    "id" uuid not null default gen_random_uuid(),
    "creator_id" uuid not null,
    "participant_id" uuid,
    "title" text,
    "description" text,
    "requirments" text,
    "prize_pool" numeric,
    "status" text not null default 'ACTIVE'::text,
    "start_date" timestamp without time zone default now(),
    "end_date" timestamp without time zone,
    "image_url" text,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."competitions" enable row level security;

create table "public"."posts" (
    "id" uuid not null default gen_random_uuid(),
    "creator_of_post_id" uuid not null,
    "competition_id" uuid not null,
    "platform" text,
    "content" text,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp without time zone default now()
);


alter table "public"."posts" enable row level security;

create table "public"."winners" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "competition_id" uuid not null,
    "post_id" uuid not null,
    "win_prize" numeric,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp without time zone default now()
);


alter table "public"."winners" enable row level security;

CREATE UNIQUE INDEX competitions_pkey ON public.competitions USING btree (id);

CREATE UNIQUE INDEX posts_pkey ON public.posts USING btree (id);

CREATE UNIQUE INDEX winners_pkey ON public.winners USING btree (id);

alter table "public"."competitions" add constraint "competitions_pkey" PRIMARY KEY using index "competitions_pkey";

alter table "public"."posts" add constraint "posts_pkey" PRIMARY KEY using index "posts_pkey";

alter table "public"."winners" add constraint "winners_pkey" PRIMARY KEY using index "winners_pkey";

alter table "public"."competitions" add constraint "competitions_creator_id_fkey" FOREIGN KEY (creator_id) REFERENCES users(id) not valid;

alter table "public"."competitions" validate constraint "competitions_creator_id_fkey";

alter table "public"."competitions" add constraint "competitions_participant_id_fkey" FOREIGN KEY (participant_id) REFERENCES users(id) not valid;

alter table "public"."competitions" validate constraint "competitions_participant_id_fkey";

alter table "public"."posts" add constraint "posts_competition_id_fkey" FOREIGN KEY (competition_id) REFERENCES competitions(id) ON DELETE CASCADE not valid;

alter table "public"."posts" validate constraint "posts_competition_id_fkey";

alter table "public"."posts" add constraint "posts_creator_of_post_id_fkey" FOREIGN KEY (creator_of_post_id) REFERENCES users(id) not valid;

alter table "public"."posts" validate constraint "posts_creator_of_post_id_fkey";

alter table "public"."winners" add constraint "winners_competition_id_fkey" FOREIGN KEY (competition_id) REFERENCES competitions(id) ON DELETE CASCADE not valid;

alter table "public"."winners" validate constraint "winners_competition_id_fkey";

alter table "public"."winners" add constraint "winners_post_id_fkey" FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE not valid;

alter table "public"."winners" validate constraint "winners_post_id_fkey";

alter table "public"."winners" add constraint "winners_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."winners" validate constraint "winners_user_id_fkey";

grant delete on table "public"."competitions" to "anon";

grant insert on table "public"."competitions" to "anon";

grant references on table "public"."competitions" to "anon";

grant select on table "public"."competitions" to "anon";

grant trigger on table "public"."competitions" to "anon";

grant truncate on table "public"."competitions" to "anon";

grant update on table "public"."competitions" to "anon";

grant delete on table "public"."competitions" to "authenticated";

grant insert on table "public"."competitions" to "authenticated";

grant references on table "public"."competitions" to "authenticated";

grant select on table "public"."competitions" to "authenticated";

grant trigger on table "public"."competitions" to "authenticated";

grant truncate on table "public"."competitions" to "authenticated";

grant update on table "public"."competitions" to "authenticated";

grant delete on table "public"."competitions" to "service_role";

grant insert on table "public"."competitions" to "service_role";

grant references on table "public"."competitions" to "service_role";

grant select on table "public"."competitions" to "service_role";

grant trigger on table "public"."competitions" to "service_role";

grant truncate on table "public"."competitions" to "service_role";

grant update on table "public"."competitions" to "service_role";

grant delete on table "public"."posts" to "anon";

grant insert on table "public"."posts" to "anon";

grant references on table "public"."posts" to "anon";

grant select on table "public"."posts" to "anon";

grant trigger on table "public"."posts" to "anon";

grant truncate on table "public"."posts" to "anon";

grant update on table "public"."posts" to "anon";

grant delete on table "public"."posts" to "authenticated";

grant insert on table "public"."posts" to "authenticated";

grant references on table "public"."posts" to "authenticated";

grant select on table "public"."posts" to "authenticated";

grant trigger on table "public"."posts" to "authenticated";

grant truncate on table "public"."posts" to "authenticated";

grant update on table "public"."posts" to "authenticated";

grant delete on table "public"."posts" to "service_role";

grant insert on table "public"."posts" to "service_role";

grant references on table "public"."posts" to "service_role";

grant select on table "public"."posts" to "service_role";

grant trigger on table "public"."posts" to "service_role";

grant truncate on table "public"."posts" to "service_role";

grant update on table "public"."posts" to "service_role";

grant delete on table "public"."winners" to "anon";

grant insert on table "public"."winners" to "anon";

grant references on table "public"."winners" to "anon";

grant select on table "public"."winners" to "anon";

grant trigger on table "public"."winners" to "anon";

grant truncate on table "public"."winners" to "anon";

grant update on table "public"."winners" to "anon";

grant delete on table "public"."winners" to "authenticated";

grant insert on table "public"."winners" to "authenticated";

grant references on table "public"."winners" to "authenticated";

grant select on table "public"."winners" to "authenticated";

grant trigger on table "public"."winners" to "authenticated";

grant truncate on table "public"."winners" to "authenticated";

grant update on table "public"."winners" to "authenticated";

grant delete on table "public"."winners" to "service_role";

grant insert on table "public"."winners" to "service_role";

grant references on table "public"."winners" to "service_role";

grant select on table "public"."winners" to "service_role";

grant trigger on table "public"."winners" to "service_role";

grant truncate on table "public"."winners" to "service_role";

grant update on table "public"."winners" to "service_role";


