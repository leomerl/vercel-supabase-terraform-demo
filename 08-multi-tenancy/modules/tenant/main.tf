# Supabase Project
resource "supabase_project" "main" {
  organization_id   = var.supabase_organization_id
  name              = "${var.tenant_name}-${var.project_name}"
  database_password = var.database_password
  region            = var.region

  lifecycle {
    ignore_changes = [database_password]
  }
}

# Vercel Project
resource "vercel_project" "main" {
  name      = "${var.tenant_name}-${var.project_name}"
  framework = var.framework

  environment = [
    {
      key    = "NEXT_PUBLIC_SUPABASE_URL"
      value  = "https://${supabase_project.main.id}.supabase.co"
      target = ["production", "preview", "development"]
    },
    {
      key    = "TENANT_NAME"
      value  = var.tenant_name
      target = ["production", "preview", "development"]
    }
  ]
}

# Vercel Project Domain
resource "vercel_project_domain" "custom_domain" {
  project_id = vercel_project.main.id
  domain     = var.domain
}