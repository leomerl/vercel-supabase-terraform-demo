variable "supabase_access_token" {
  description = "Supabase access token"
  type        = string
  sensitive   = true
}

variable "supabase_organization_id" {
  description = "Supabase organization ID"
  type        = string
}

variable "project_name" {
  description = "Project name for both Supabase and Vercel"
  type        = string
}

variable "database_password" {
  description = "Database password for Supabase project"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "AWS region for Supabase project"
  type        = string
  default     = "us-east-1"
}

variable "vercel_api_token" {
  description = "Vercel API token"
  type        = string
  sensitive   = true
}

variable "framework" {
  description = "Framework for Vercel project"
  type        = string
  default     = "nextjs"
}

variable "git_repository" {
  description = "Git repository for Vercel project (format: username/repo)"
  type        = string
  default     = ""
}

variable "domain" {
  description = "Custom domain for Vercel project"
  type        = string
}