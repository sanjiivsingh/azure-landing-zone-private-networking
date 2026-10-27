resource "azurerm_resource_group" "private_net" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.private_net.location
  resource_group_name = azurerm_resource_group.private_net.name
  address_space       = [var.address_space]
  tags                = var.tags
}

resource "azurerm_subnet" "pe_subnet" {
  name                 = "snet-private-endpoints"
  resource_group_name  = azurerm_resource_group.private_net.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.pe_subnet_prefix]
}

module "private_dns" {
  source = "../../modules/private_dns"

  resource_group_name = azurerm_resource_group.private_net.name
  virtual_network_ids = {
    "dev-vnet" = azurerm_virtual_network.vnet.id
  }
  tags = var.tags
}

# Example Storage Account with Zero Public Access
resource "azurerm_storage_account" "example" {
  #checkov:skip=CKV_AZURE_33:Queue logging not required for blob storage example
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.private_net.name
  location                        = azurerm_resource_group.private_net.location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  public_network_access_enabled   = false
  allow_nested_items_to_be_public = false
  min_tls_version                 = "TLS1_2"
  tags                            = var.tags
}

module "storage_private_endpoint" {
  source = "../../modules/private_endpoints"

  endpoint_name       = "pe-storage-blob-dev"
  location            = azurerm_resource_group.private_net.location
  resource_group_name = azurerm_resource_group.private_net.name
  subnet_id           = azurerm_subnet.pe_subnet.id
  target_resource_id  = azurerm_storage_account.example.id
  subresource_name    = "blob"
  private_dns_zone_id = module.private_dns.blob_dns_zone_id
  tags                = var.tags
}
