resource "vercel_project" "main" {
  name      = var.project_name
  framework = var.framework

  # Git repository configuration is optional
  # If git_repository variable is provided, configure the connection
  # Note: Requires Vercel for GitHub/GitLab/Bitbucket to be installed
  # Using conditional to only set if repository is provided
  git_repository = var.git_repository != "" ? {
    type = "github"
    repo = var.git_repository
  } : null

  environment = [
    {
      key    = "NEXT_PUBLIC_APP_URL"
      value  = "https://${var.project_name}.vercel.app"
      target = ["production", "preview", "development"]
    }
  ]
}