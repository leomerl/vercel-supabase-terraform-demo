# Tenant A specific variables

locals {
  project_name      = "app"
  database_password = "tenant-a-super-secure-password-change-me!"
  domain           = "tenant-a.example.com"
  git_repository   = ""  # Set to "username/repo" if you have a GitHub repository
}