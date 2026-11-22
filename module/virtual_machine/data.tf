data "azurerm_network_interface" "nic" {
  for_each = var.virtual_machine
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "kv" {
  for_each            = var.virtual_machine
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.virtual_machine
  name         = each.value.secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}