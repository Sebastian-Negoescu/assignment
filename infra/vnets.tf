resource "azurerm_virtual_network" "west_vnet" {
    name = "${var.primaryLocation}-vnet"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    location = "${var.primaryLocation}"
    address_space = ["${var.vnet_address_space_we}"]
    #subnet {
    #    name = "subnet-west"
    #    address_prefix = "${var.subnet_address_prefix_we}"
    #}
}

resource "azurerm_subnet" "west_subnet" {
    name = "${var.primaryLocation}_subnet"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    virtual_network_name = "${azurerm_virtual_network.west_vnet.name}"
    address_prefix = "${var.subnet_address_prefix_we}"
}


resource "azurerm_virtual_network" "north_vnet" {
    name = "${var.secondaryLocation}-vnet"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    location = "${var.secondaryLocation}"
    address_space = ["${var.vnet_address_space_ne}"]
    #subnet {
    #    name = "subnet-north"
    #    address_prefix = "${var.subnet_address_prefix_ne}"
    #}
}

resource "azurerm_subnet" "north_subnet" {
    name = "${var.secondaryLocation}_subnet"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    virtual_network_name = "${azurerm_virtual_network.north_vnet.name}"
    address_prefix = "${var.subnet_address_prefix_ne}"
}