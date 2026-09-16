/* Supabase connection. The anon key is public by design; row level
   security (supabase/schema.sql) keeps each user's data private.
   Never put the service_role key here. Leave blank to run browser-only. */
window.BR_SUPABASE = {
  url: 'https://nzcaqvxzcxfeihhpdfdy.supabase.co',
  anonKey: 'sb_publishable_RGLvXqD7z-2rQiC-7-Rp3Q_AOBvIzKm'
};
