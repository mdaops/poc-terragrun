output "project_id" {
  value       = google_project.project.project_id
  description = "The ID of the created project"
}

output "project_number" {
  value       = google_project.project.number
  description = "The number of the created project"
}

output "billing_account" {
  value = var.billing_account
}
