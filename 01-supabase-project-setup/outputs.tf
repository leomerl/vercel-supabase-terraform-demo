# Note: The supabase_project resource doesn't export api_key or database_url
# These would typically be retrieved from separate data sources or resources
# For now, commenting these out as they're not available attributes

# output "supabase_api_key" {
#   value       = supabase_project.main.api_key
#   sensitive   = true
#   description = "The API key for the Supabase project"
# }

# output "supabase_database_url" {
#   value       = supabase_project.main.database_url
#   sensitive   = true
#   description = "The database URL for the Supabase project"
# }

output "supabase_project_id" {
  value       = supabase_project.main.id
  description = "The ID of the Supabase project"
}

output "supabase_url" {
  value       = "https://${supabase_project.main.id}.supabase.co"
  description = "The URL of the Supabase project"
}