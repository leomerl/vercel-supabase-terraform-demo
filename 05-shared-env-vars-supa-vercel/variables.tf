variable "supabase_access_token" {
  description = "Supabase access token"
  type        = string
  sensitive   = true
}

variable "supabase_organization_id" {
  description = "Supabase organization ID"
  type        = string
}

variable "supabase_project_name" {
  description = "Name for the Supabase project"
  type        = string
}

variable "supabase_db_password" {
  description = "Database password for Supabase project"
  type        = string
  sensitive   = true
}

variable "vercel_api_token" {
  description = "Vercel API token"
  type        = string
  sensitive   = true
}

variable "vercel_project_id" {
  description = "Vercel project ID to add environment variables to"
  type        = string
}