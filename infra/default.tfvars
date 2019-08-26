uipath_rg_name = "candidate-756fce-rg"

primaryLocation = "westeurope"

secondaryLocation = "northeurope"

vnet_address_space_we = "10.0.0.0/16"
subnet_address_prefix_we = "10.0.0.0/24"

vnet_address_space_ne = "10.1.0.0/16"
subnet_address_prefix_ne = "10.1.0.0/24"

pipDnsName_we = "sebinegovmwest"
pipDnsName_ne = "sebinegovmnorth"

nicName = "vmNIC"

privateIp_west = "10.0.0.4"
privateIp_north = "10.1.0.4"

vmName = "uipath_vm"
vmSize = "Standard_D2s_v3"

admin_username = "ansible"
user_ssh_key_path = "/home/ansible/.ssh/authorized_keys"
user_ssh_key = "ssh-rsa my_public_key sebinegoescu@sebinego-MacBook-Air.local"