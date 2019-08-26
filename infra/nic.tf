resource "azurerm_network_interface" "west_nic" {
    name = "${var.primaryLocation}-${var.nicName}"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    location = "${var.primaryLocation}"
    #depends_on = [
    #    "${azurerm_public_ip.west_pip.id}", 
    #    "${azurerm_virtual_network.west_vnet.id}"
    #]

    ip_configuration {
        name = "ipConfig_${var.primaryLocation}"
        subnet_id = "${azurerm_subnet.west_subnet.id}"
        private_ip_address_allocation = "Static"
        private_ip_address = "${var.privateIp_west}"
        public_ip_address_id = "${azurerm_public_ip.west_pip.id}"
    }
}

resource "azurerm_network_interface" "north_nic" {
    name = "${var.secondaryLocation}-${var.nicName}"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    location = "${var.secondaryLocation}"
    #depends_on = [
    #    "${azurerm_public_ip.north_pip.id}",
    #    "${azurerm_virtual_network.north_vnet.id}"
    #]

    ip_configuration {
        name = "ipConfig_${var.secondaryLocation}"
        subnet_id = "${azurerm_subnet.north_subnet.id}"
        private_ip_address_allocation = "Static"
        private_ip_address = "${var.privateIp_north}"
        public_ip_address_id = "${azurerm_public_ip.north_pip.id}"
    }
}