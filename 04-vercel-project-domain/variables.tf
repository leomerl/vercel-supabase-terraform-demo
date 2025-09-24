variable "vercel_api_token" {
  description = "Vercel API token"
  type        = string
  sensitive   = true
}

variable "project_id" {
  description = "Vercel project ID"
  type        = string
}

variable "domain" {
  description = "The domain name to add to the project"
  type        = string
}

variable "redirect_to_domain" {
  description = "Domain to redirect to (optional)"
  type        = string
  default     = null
}

variable "redirect_status_code" {
  description = "Status code for redirect (301, 302, 307, 308)"
  type        = number
  default     = null
}