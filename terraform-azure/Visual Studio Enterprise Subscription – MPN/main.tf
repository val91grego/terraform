#IaC Resources

resource "azurerm_resource_group" "rg-terraform-dev1" {
  name     = "rg-terraform-dev1"
  location = var.location
}

resource "azurerm_resource_group" "rg-terraform-dev2" {
  name     = var.resource_group_name
  location = var.location
}