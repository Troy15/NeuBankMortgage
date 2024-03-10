resource "azurerm_app_service_environment_v3" "ase_v3" {
  name                  = var.ase_v3.name
  resource_group_name   = var.ase_v3.resource_group_name
  subnet_id             = var.ase_v3.subnet_id

  tags                  = var.ase_v3.tags
}
