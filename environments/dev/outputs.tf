output "blob_dns_zone_id" {
  description = "Private DNS zone ID for blob storage."
  value       = module.private_dns.blob_dns_zone_id
}

output "storage_private_ip" {
  description = "Allocated private IP for the storage account endpoint."
  value       = module.storage_private_endpoint.private_ip_address
}
