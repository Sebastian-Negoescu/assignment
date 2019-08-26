provider "azurerm" {
    version = "1.0.0"
    subscription_id = "${var.subscription_id}"
    tenant_id = "${var.tenant_id}"
}

# JUST ONE WAY OF USING A BACKEND
#terraform {
#    backend "azurerm" {
#        resource_group_name = "candidate-756fce-rg"
#        storage_account_name = "tfstatestacc"
#        container_name = "infratfcontainer"
#        access_key = "<access_key_of_the_storagea_account>"
#        key = "infra.terraform.tfstate"
#    }
#}

resource "azurerm_resource_group" "uipath_rg" {
    name = "${var.uipath_rg_name}"
    location = "westeurope"
}