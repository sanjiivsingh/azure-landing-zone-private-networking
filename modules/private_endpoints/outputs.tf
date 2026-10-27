output "private_endpoint_id" {
  description = "Resource ID of the Private Endpoint."
  value       = azurerm_private_endpoint.endpoint.id
}

output "private_ip_address" {
  description = "Allocated private IP address."
  value       = azurerm_private_endpoint.endpoint.private_service_connection[0].private_ip_address
}
