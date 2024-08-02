
variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "repository_name" {
  description = "The name of the repository"
  type        = string
}

variable "owner" {
  description = "The owner of the project"
  type        = string
}

variable "region" {
  description = "The default region for resources"
  type        = string
  default     = "us-central1"
}

variable "folder_id" {
  description = "The folder ID to create the project in"
  type        = string
}

variable "billing_account" {
  description = "The billing account to associate with the project"
  type        = string
}

output "project_id" {
  value       = google_project.project.project_id
  description = "The ID of the created project"
}

output "project_number" {
  value       = google_project.project.number
  description = "The number of the created project"
}
