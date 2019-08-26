resource "azurerm_public_ip" "west_pip" {
    name = "${var.primaryLocation}-pip"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    location = "${var.primaryLocation}"
    domain_name_label = "${var.pipDnsName_we}"
    public_ip_address_allocation = "Static"
}

resource "azurerm_public_ip" "north_pip" {
    name = "${var.secondaryLocation}-pip"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    location = "${var.secondaryLocation}"
    domain_name_label = "${var.pipDnsName_ne}"
    public_ip_address_allocation = "Static"
}