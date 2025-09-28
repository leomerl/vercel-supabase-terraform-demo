# Tenant B specific variables

locals {
  project_name      = "platform"
  database_password = "tenant-b-ultra-secure-password-change-me!"
  domain           = "tenant-b.example.com"
  git_repository   = ""  # Set to "username/repo" if you have a GitHub repository
}