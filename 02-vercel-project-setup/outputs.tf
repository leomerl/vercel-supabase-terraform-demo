output "project_id" {
  description = "The ID of the Vercel project"
  value       = vercel_project.main.id
}

output "project_url" {
  description = "The URL of the deployed project"
  value       = "https://${var.project_name}.vercel.app"
}