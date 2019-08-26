resource "azurerm_traffic_manager_profile" "tm_profile" {
    name = "uipath-devops-sn"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    traffic_routing_method = "Priority"

    dns_config {
        relative_name = "${azurerm_resource_group.uipath_rg.name}"
        ttl = 30
    }

    monitor_config {
        protocol = "http"
        port = 80
        path = "/"
    }
}

resource "azurerm_traffic_manager_endpoint" "west_endpoint" {
    name = "${var.vmName}-${var.primaryLocation}-endpoint"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    profile_name = "${azurerm_traffic_manager_profile.tm_profile.name}"
    target_resource_id = "${azurerm_public_ip.west_pip.id}"
    type = "azureEndpoints"
    priority = 1
}

resource "azurerm_traffic_manager_endpoint" "north_endpoint" {
    name = "${var.vmName}-${var.secondaryLocation}-endpoint"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    profile_name = "${azurerm_traffic_manager_profile.tm_profile.name}"
    target_resource_id = "${azurerm_public_ip.north_pip.id}"
    type = "azureEndpoints"
    priority = 2
}