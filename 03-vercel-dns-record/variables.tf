variable "vercel_api_token" {
  description = "Vercel API token for authentication"
  type        = string
  sensitive   = true
}

variable "domain" {
  description = "The domain name to configure DNS records for"
  type        = string
}

variable "team_id" {
  description = "Vercel team ID (optional, leave empty for personal account)"
  type        = string
  default     = ""
}

variable "dns_records" {
  description = "List of DNS records to create"
  type = list(object({
    name  = string
    type  = string
    value = string
    ttl   = optional(number, 60)
  }))
  default = []
}