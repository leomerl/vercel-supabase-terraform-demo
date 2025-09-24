output "vercel_project_id" {
  description = "The ID of the Vercel project"
  value       = vercel_project.main.id
}

output "supabase_database_url" {
  description = "The database URL for the Supabase project"
  value       = "postgresql://postgres.${supabase_project.main.id}:${var.database_password}@aws-0-${var.region}.pooler.supabase.com:5432/postgres"
  sensitive   = true
}

output "supabase_api_url" {
  description = "The API URL for the Supabase project"
  value       = "https://${supabase_project.main.id}.supabase.co"
}

output "supabase_anon_key" {
  description = "The anonymous API key for the Supabase project"
  value       = supabase_project.main.api_keys[0].api_key
  sensitive   = true
}

output "vercel_project_url" {
  description = "The URL of the Vercel project"
  value       = "https://${var.project_name}.vercel.app"
}

output "vercel_custom_domain" {
  description = "The custom domain configured for the Vercel project"
  value       = var.domain
}