output "blob_dns_zone_id" {
  description = "Resource ID of the blob Private DNS zone."
  value       = azurerm_private_dns_zone.blob.id
}

output "vault_dns_zone_id" {
  description = "Resource ID of the Key Vault Private DNS zone."
  value       = azurerm_private_dns_zone.vault.id
}

output "sql_dns_zone_id" {
  description = "Resource ID of the Azure SQL Private DNS zone."
  value       = azurerm_private_dns_zone.sql.id
}
