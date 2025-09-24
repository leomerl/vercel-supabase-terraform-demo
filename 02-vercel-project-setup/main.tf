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
      key    = "NEXT_PUBLIC_APP_URL"
      value  = "https://${var.project_name}.vercel.app"
      target = ["production", "preview", "development"]
    }
  ]
}