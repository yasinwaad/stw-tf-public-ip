resource "azurerm_public_ip" "this" {
  for_each = var.public_ips

  name                = local.public_ip_names[each.key]
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
  tags                = local.common_tags
}