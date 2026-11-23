provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-example-dev-southafricanorth"
  location = "southafricanorth"
}

module "public_ip" {
  source = "../.."

  project_name        = "example"
  environment         = "dev"
  owner               = "Yasin"
  resource_group_name = azurerm_resource_group.example.name

  public_ips = {
    bastion = {}
    nat     = {}
  }
}