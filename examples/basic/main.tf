terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "dns" {
  source = "../.."

  project_id = var.project_id
  name       = "example-zone"
  dns_name   = "example.internal."

  records = {
    www = {
      name    = "www.example.internal."
      type    = "A"
      ttl     = 300
      rrdatas = ["10.0.0.10"]
    }
  }
}

variable "project_id" {
  description = "Project ID to deploy the example managed zone into."
  type        = string
}

variable "region" {
  description = "Region for the google provider."
  type        = string
  default     = "us-central1"
}

output "zone_name_servers" {
  value = module.dns.name_servers
}
