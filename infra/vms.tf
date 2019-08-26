resource "azurerm_virtual_machine" "vm-west" {
    name = "${var.vmName}-${var.primaryLocation}"
    location = "${var.primaryLocation}"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    network_interface_ids = ["${azurerm_network_interface.west_nic.id}"]
    vm_size = "${var.vmSize}"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-LTS"
        version = "latest"
    }

    storage_os_disk {
        name = "${var.vmName}_osDisk-WE"
        create_option = "FromImage"
        caching = "ReadWrite"
        managed_disk_type = "Standard_LRS"
    }

    os_profile {
        computer_name = "${var.pipDnsName_we}"
        admin_username = "${var.admin_username}"
    }

    os_profile_linux_config {
        disable_password_authentication = true

        ssh_keys {
            path = "${var.user_ssh_key_path}"
            key_data = "${var.user_ssh_key}"
        }
    }
}

resource "azurerm_virtual_machine_extension" "postDeployment_west" {
    name = "installAnsible_west"
    location = "${var.primaryLocation}"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    virtual_machine_name = "${azurerm_virtual_machine.vm-west.name}"
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.0"

    settings = <<SETTINGS
    {
        "commandToExecute": "sudo apt install ansible --yes"
    }
    SETTINGS
}

resource "azurerm_virtual_machine" "vm-north" {
    name = "${var.vmName}-${var.secondaryLocation}"
    location = "${var.secondaryLocation}"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    network_interface_ids = ["${azurerm_network_interface.north_nic.id}"]
    vm_size = "${var.vmSize}"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-LTS"
        version = "latest"
    }

    storage_os_disk {
        name = "${var.vmName}_osDisk-NE"
        create_option = "FromImage"
        caching = "ReadWrite"
        managed_disk_type = "Standard_LRS"
    }

    os_profile {
        computer_name = "${var.pipDnsName_ne}"
        admin_username = "${var.admin_username}"
    }

    os_profile_linux_config {
        disable_password_authentication = true

        ssh_keys {
            path = "${var.user_ssh_key_path}"
            key_data = "${var.user_ssh_key}"
        }
    }    
}

resource "azurerm_virtual_machine_extension" "postDeployment_north" {
    name = "installAnsible_north"
    location = "${var.secondaryLocation}"
    resource_group_name = "${azurerm_resource_group.uipath_rg.name}"
    virtual_machine_name = "${azurerm_virtual_machine.vm-north.name}"
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.0"

    settings = <<SETTINGS
    {
        "commandToExecute": "sudo apt install ansible --yes"
    }
    SETTINGS
}
