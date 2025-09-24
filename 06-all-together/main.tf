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

# Vercel Project
resource "vercel_project" "main" {
  name      = var.project_name
  framework = var.framework

  dynamic "git_repository" {
    for_each = var.git_repository != "" ? [1] : []
    content {
      type = "github"
      repo = var.git_repository
    }
  }

  environment = [
    {
      key    = "NEXT_PUBLIC_SUPABASE_URL"
      value  = "https://${supabase_project.main.id}.supabase.co"
      target = ["production", "preview", "development"]
    },
    {
      key    = "NEXT_PUBLIC_SUPABASE_ANON_KEY"
      value  = supabase_project.main.api_keys[0].api_key
      target = ["production", "preview", "development"]
    }
  ]
}

# Vercel Project Domain
resource "vercel_project_domain" "custom_domain" {
  project_id = vercel_project.main.id
  domain     = var.domain
}