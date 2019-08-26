variable "subscription_id" {
    type = "string"
    description = "UiPath Subscription for resources deployment."
}

variable "tenant_id" {
    type = "string"
    description = "Azure Tenant for UiPath assignment."
}

variable "uipath_rg_name" {
    type = "string"
    description = "RG used for resources."
}

variable "primaryLocation" {
    type = "string"
    description = "Primary locatiomn for resources - WEST EUROPE."
}

variable "secondaryLocation" {
    type = "string"
    description = "Secondary location for resources - NORTH EUROPE."
  
}
#All right, cool. So we know how variables work... For the pace-sake of the progress, will create the vars in the default.tfvars directly...

variable "vnet_address_space_we" {}
variable "subnet_address_prefix_we" {}
variable "vnet_address_space_ne" {}
variable "subnet_address_prefix_ne" {}

variable "pipDnsName_we" {}
variable "pipDnsName_ne" {}

variable "nicName" {}

variable "privateIp_west" {}
variable "privateIp_north" {}

variable "vmName" {}
variable "vmSize" {}
variable "admin_username" {}

variable "user_ssh_key_path" {}
variable "user_ssh_key" {}
