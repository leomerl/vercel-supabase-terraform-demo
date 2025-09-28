# Retrieve API keys using data source
data "supabase_apikeys" "keys" {
  project_ref = supabase_project.main.id
}

# Retrieve database connection strings
data "supabase_pooler" "pooler" {
  project_ref = supabase_project.main.id
}

output "supabase_anon_key" {
  value       = data.supabase_apikeys.keys.anon_key
  sensitive   = true
  description = "The anonymous API key for the Supabase project"
}

output "supabase_service_role_key" {
  value       = data.supabase_apikeys.keys.service_role_key
  sensitive   = true
  description = "The service role API key for the Supabase project"
}

output "supabase_project_id" {
  value       = supabase_project.main.id
  description = "The ID of the Supabase project"
}

output "supabase_url" {
  value       = "https://${supabase_project.main.id}.supabase.co"
  description = "The URL of the Supabase project"
}

output "supabase_database_url" {
  value       = data.supabase_pooler.pooler.url["transaction"]
  sensitive   = true
  description = "The database URL for the Supabase project (transaction mode)"
}