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
  project                    = google_project.project.project_id
  service                    = each.key
  disable_dependent_services = true
}

