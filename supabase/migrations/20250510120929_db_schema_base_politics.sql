create policy "Enable delete for users based on creator_id"
on "public"."competitions"
as permissive
for delete
to public
using ((( SELECT auth.uid() AS uid) = creator_id));


create policy "Enable insert for authenticated users only"
on "public"."competitions"
as permissive
for insert
to authenticated
with check (true);


create policy "Enable read access for all users"
on "public"."competitions"
as permissive
for select
to public
using (true);


create policy "Enable update for users based on email"
on "public"."competitions"
as permissive
for update
to public
using ((( SELECT auth.uid() AS uid) = creator_id))
with check ((( SELECT auth.uid() AS uid) = creator_id));


create policy "Enable delete for users based on creator_of_post_id"
on "public"."posts"
as permissive
for delete
to public
using ((( SELECT auth.uid() AS uid) = creator_of_post_id));


create policy "Enable insert for authenticated users only"
on "public"."posts"
as permissive
for insert
to authenticated
with check (true);


create policy "Enable read access for all users"
on "public"."posts"
as permissive
for select
to public
using (true);


create policy "Enable update for users based on creator_of_post_id"
on "public"."posts"
as permissive
for update
to public
using ((( SELECT auth.uid() AS uid) = creator_of_post_id))
with check ((( SELECT auth.uid() AS uid) = creator_of_post_id));


create policy "Enable delete for users based on user_id"
on "public"."users"
as permissive
for delete
to public
using ((( SELECT auth.uid() AS uid) = id));


create policy "Enable insert for authenticated users only"
on "public"."users"
as permissive
for insert
to authenticated
with check (true);


create policy "Enable read access for all users"
on "public"."users"
as permissive
for select
to public
using (true);


create policy "Enable update for users based on id"
on "public"."users"
as permissive
for update
to authenticated
using ((( SELECT auth.uid() AS uid) = id))
with check ((( SELECT auth.uid() AS uid) = id));


create policy "Enable delete for Creator of Competition"
on "public"."winners"
as permissive
for delete
to public
using ((( SELECT auth.uid() AS uid) = ( SELECT competitions.creator_id
   FROM competitions
  WHERE (winners.competition_id = competitions.id))));


create policy "Enable insert for Creator of Competition"
on "public"."winners"
as permissive
for insert
to authenticated
with check ((( SELECT auth.uid() AS uid) = ( SELECT competitions.creator_id
   FROM competitions
  WHERE (winners.competition_id = competitions.id))));


create policy "Enable read access for all users"
on "public"."winners"
as permissive
for select
to public
using (true);


create policy "Enable update for Creator of competition"
on "public"."winners"
as permissive
for update
to public
using ((( SELECT auth.uid() AS uid) = ( SELECT competitions.creator_id
   FROM competitions
  WHERE (winners.competition_id = competitions.id))))
with check ((( SELECT auth.uid() AS uid) = ( SELECT competitions.creator_id
   FROM competitions
  WHERE (winners.competition_id = competitions.id))));



