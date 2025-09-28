resource "supabase_project" "main" {
  organization_id   = var.supabase_organization_id
  name              = var.supabase_project_name
  database_password = var.supabase_db_password
  region            = var.supabase_region

  lifecycle {
    ignore_changes = [database_password]
  }
}

# Retrieve API keys using data source
data "supabase_apikeys" "keys" {
  project_ref = supabase_project.main.id
}

locals {
  supabase_url     = "https://${supabase_project.main.id}.supabase.co"
  supabase_anon_key = data.supabase_apikeys.keys.anon_key
}

resource "vercel_shared_environment_variable" "supabase_url" {
  key        = "NEXT_PUBLIC_SUPABASE_URL"
  value      = local.supabase_url
  target     = ["production"]
  project_ids = [var.vercel_project_id]
}

resource "vercel_shared_environment_variable" "supabase_anon_key" {
  key        = "NEXT_PUBLIC_SUPABASE_ANON_KEY"
  value      = local.supabase_anon_key
  target     = ["production"]
  project_ids = [var.vercel_project_id]
  sensitive  = true
}