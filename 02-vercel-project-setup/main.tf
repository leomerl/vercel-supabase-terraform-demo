resource "vercel_project" "main" {
  name      = var.project_name
  framework = var.framework

  # Git repository configuration (if provided)
  # Note: In v1.x of the provider, git_repository is configured differently
  # Commenting out for now as it requires a different structure
  # git_repository = var.git_repository != "" ? {
  #   type = "github"
  #   repo = var.git_repository
  # } : null

  environment = [
    {
      key    = "NEXT_PUBLIC_APP_URL"
      value  = "https://${var.project_name}.vercel.app"
      target = ["production", "preview", "development"]
    }
  ]
}