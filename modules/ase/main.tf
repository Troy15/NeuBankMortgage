resource "azurerm_app_service_environment" "ase" {
  name                         = var.ase.name
  resource_group_name          = var.ase.resource_group_name
  subnet_id                    = var.ase.subnet_id
  pricing_tier                 = var.ase.pricing_tier
  front_end_scale_factor       = var.ase.front_end_scale_factor
  internal_load_balancing_mode = var.ase.internal_load_balancing_mode

  tags = var.ase.tags
}
