variable "endpoint_name" {
  type        = string
  description = "Name of the Private Endpoint."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name."
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where Private Endpoint NIC will be created."
}

variable "target_resource_id" {
  type        = string
  description = "Resource ID of the target Azure PaaS service."
}

variable "subresource_name" {
  type        = string
  description = "Subresource name (e.g. 'blob', 'vault', 'sqlServer')."
}

variable "private_dns_zone_id" {
  type        = string
  description = "Resource ID of the associated Private DNS zone."
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default     = {}
}
