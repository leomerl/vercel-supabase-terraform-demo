resource "supabase_project" "main" {
  organization_id   = var.supabase_organization_id
  name              = var.project_name
  database_password = var.database_password
  region            = var.region

  lifecycle {
    ignore_changes = [database_password]
  }
}