resource "supabase_project" "project" {
  organization_id   = var.supabase_organization_id
  name              = var.supabase_project_name
  database_password = var.supabase_db_password
  region            = "us-east-1"
}

locals {
  supabase_url     = "https://${supabase_project.project.id}.supabase.co"
  supabase_anon_key = supabase_project.project.api_keys[0].api_key
}

resource "vercel_shared_environment_variable" "supabase_url" {
  key        = "NEXT_PUBLIC_SUPABASE_URL"
  value      = local.supabase_url
  target     = ["production"]
  project_id = var.vercel_project_id
}

resource "vercel_shared_environment_variable" "supabase_anon_key" {
  key        = "NEXT_PUBLIC_SUPABASE_ANON_KEY"
  value      = local.supabase_anon_key
  target     = ["production"]
  project_id = var.vercel_project_id
  sensitive  = true
}