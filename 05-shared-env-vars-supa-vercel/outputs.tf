output "supabase_project_id" {
  description = "Supabase project ID"
  value       = supabase_project.project.id
}

output "supabase_url" {
  description = "Supabase project URL"
  value       = local.supabase_url
}

output "supabase_anon_key" {
  description = "Supabase anonymous key"
  value       = local.supabase_anon_key
  sensitive   = true
}