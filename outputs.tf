output "id" {
  description = "Identifier of the managed zone."
  value       = google_dns_managed_zone.this.id
}

output "name" {
  description = "Name of the managed zone."
  value       = google_dns_managed_zone.this.name
}

output "name_servers" {
  description = "Name servers delegated to this managed zone."
  value       = google_dns_managed_zone.this.name_servers
}
