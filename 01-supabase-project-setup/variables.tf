variable "supabase_access_token" {
  description = "The access token for authenticating with Supabase"
  type        = string
  sensitive   = true
}

variable "supabase_organization_id" {
  description = "The Supabase organization ID"
  type        = string
}

variable "project_name" {
  description = "Name of the Supabase project"
  type        = string
  default     = "terraform-demo-project"
}

variable "database_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "The region where the Supabase project will be created"
  type        = string
  default     = "us-east-1"
}