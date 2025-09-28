output "domain_id" {
  description = "The ID of the domain"
  value       = vercel_project_domain.custom_domain.id
}

output "domain" {
  description = "The domain name"
  value       = vercel_project_domain.custom_domain.domain
}

# Note: apex_name attribute is not available in this provider version
# output "apex_name" {
#   description = "The apex name of the domain"
#   value       = vercel_project_domain.custom_domain.apex_name
# }