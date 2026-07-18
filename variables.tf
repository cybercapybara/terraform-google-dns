variable "project_id" {
  description = "ID of the project in which to create the managed zone."
  type        = string
}

variable "name" {
  description = "Name of the managed DNS zone."
  type        = string
}

variable "dns_name" {
  description = "DNS name of the zone, ending with a trailing dot (e.g. example.com.)."
  type        = string

  validation {
    condition     = can(regex("\\.$", var.dns_name))
    error_message = "dns_name must end with a trailing dot."
  }
}

variable "description" {
  description = "Description for the managed zone."
  type        = string
  default     = "Managed by Terraform"
}

variable "visibility" {
  description = "Zone visibility: public or private."
  type        = string
  default     = "public"

  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "visibility must be either public or private."
  }
}

variable "records" {
  description = "DNS records to create, keyed by an arbitrary id. Each entry sets name, type, ttl and rrdatas."
  type = map(object({
    name    = string
    type    = string
    ttl     = number
    rrdatas = list(string)
  }))
  default = {}
}

variable "labels" {
  description = "Labels applied to the managed zone."
  type        = map(string)
  default     = {}
}
