variable "vercel_api_token" {
  description = "Vercel API Token"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Name of the Vercel project"
  type        = string
}

variable "framework" {
  description = "Framework preset for the project"
  type        = string
  default     = "nextjs"
}

variable "git_repository" {
  description = "Git repository URL"
  type        = string
  default     = ""
}