variable "location" {
  type        = string
  description = "Azure region."
  default     = "eastus2"
}

variable "resource_group_name" {
  type        = string
  description = "Target Resource Group."
  default     = "rg-corp-private-net-dev"
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network name."
  default     = "vnet-corp-private-net-dev"
}

variable "address_space" {
  type        = string
  description = "VNet CIDR block."
  default     = "10.2.0.0/16"
}

variable "pe_subnet_prefix" {
  type        = string
  description = "Subnet CIDR for private endpoints."
  default     = "10.2.1.0/24"
}

variable "storage_account_name" {
  type        = string
  description = "Unique storage account name (alphanumeric, lowercase)."
  default     = "stcorpprivatenetdev001"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default = {
    Environment = "dev"
    Project     = "PrivateNetworkingLandingZone"
    ManagedBy   = "Terraform"
  }
}
