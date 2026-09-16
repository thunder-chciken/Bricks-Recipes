/* Supabase connection. The anon key is public by design; row level
   security (supabase/schema.sql) keeps each user's data private.
   Never put the service_role key here. Leave blank to run browser-only. */
window.BR_SUPABASE = {
  url: '',
  anonKey: ''
};
