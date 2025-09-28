# Supabase Project
resource "supabase_project" "main" {
  organization_id   = var.supabase_organization_id
  name              = var.project_name
  database_password = var.database_password
  region            = var.region

  lifecycle {
    ignore_changes = [database_password]
  }
}

# Retrieve API keys using data source
data "supabase_apikeys" "keys" {
  project_ref = supabase_project.main.id
}

# Vercel Project
resource "vercel_project" "main" {
  name      = var.project_name
  framework = var.framework

  # Git repository configuration is optional
  # If git_repository variable is provided, configure the connection
  # Note: Requires Vercel for GitHub/GitLab/Bitbucket to be installed
  git_repository = var.git_repository != "" ? {
    type = "github"
    repo = var.git_repository
  } : null

  environment = [
    {
      key    = "NEXT_PUBLIC_SUPABASE_URL"
      value  = "https://${supabase_project.main.id}.supabase.co"
      target = ["production", "preview", "development"]
    },
    {
      key    = "NEXT_PUBLIC_SUPABASE_ANON_KEY"
      value  = data.supabase_apikeys.keys.anon_key
      target = ["production", "preview", "development"]
    }
  ]
}

# Vercel Project Domain
resource "vercel_project_domain" "custom_domain" {
  project_id = vercel_project.main.id
  domain     = var.domain
}