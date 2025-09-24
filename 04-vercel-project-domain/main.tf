resource "vercel_project_domain" "custom_domain" {
  project_id = var.project_id
  domain     = var.domain

  redirect             = var.redirect_to_domain
  redirect_status_code = var.redirect_status_code
}