variable "resource_group_name" {
  type        = string
  description = "Target Resource Group name for Private DNS zones."
}

variable "virtual_network_ids" {
  type        = map(string)
  description = "Map of virtual network IDs to link to Private DNS zones."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default     = {}
}
