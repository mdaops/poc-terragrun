terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project" "project" {
  name            = var.repository_name
  project_id      = var.project_id
  folder_id       = var.folder_id
  billing_account = var.billing_account
}

resource "google_project_service" "services" {
  for_each = toset([
    "compute.googleapis.com",
    "containerregistry.googleapis.com",
    "cloudbuild.googleapis.com"
  ])
  project = google_project.project.project_id
  service = each.key

  disable_dependent_services = true
}

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

# outputs.tf

output "project_id" {
  value       = google_project.project.project_id
  description = "The ID of the created project"
}

output "project_number" {
  value       = google_project.project.number
  description = "The number of the created project"
}
