#############################
## Variables
#############################
variable sydney_network_address_space     { type = "list"   }  # CIDR Address Space
variable sydney_public_address_space      { type = "string" }  # Recommended /18
variable sydney_private_address_space     { type = "string" }  # Recommended /17
variable sydney_edge_address_space        { type = "string" }  # Recommended /18

variable victoria_network_address_space   { type = "list"   }  # CIDR Address Space
variable victoria_public_address_space    { type = "string" }  
variable victoria_private_address_space   { type = "string" }  
variable victoria_edge_address_space      { type = "string" }  

variable environment                      { type = "string" }

#############################
## Resource Group
#############################
module core_sydney {
  source = "git@github.com/WestpacCloudEngineering/tf-module-azure-core.git"

  account_name = "${var.environment}coresyd"
  location = "Australia East"

  network_address_space = "${var.sydney_network_address_space}"
  public_address_space  = "${var.sydney_public_address_space}"
  private_address_space = "${var.sydney_private_address_space}"
  edge_address_space    = "${var.sydney_edge_address_space}"
}

module core_melbourne {
  source = "git@github.com/WestpacCloudEngineering/tf-module-azure-core.git"

  account_name = "${var.environment}coremelb"
  location = "Australia Southeast"

  network_address_space = "${var.sydney_network_address_space}"
  public_address_space  = "${var.sydney_public_address_space}"
  private_address_space = "${var.sydney_private_address_space}"
  edge_address_space    = "${var.sydney_edge_address_space}"
}

#############################
## Resource Group
#############################

output "melb_resource_group_name" { value = "${module.core_melbourne.resource_group_name}"}
output "melb_location"            { value = "${module.core_melbourne.location}"}
output "melb_edge_subnet_id"      { value = "${module.core_melbourne.edge_subnet_id}"}
output "melb_private_subnet_id"   { value = "${module.core_melbourne.private_subnet_id}"}
output "melb_public_subnet_id"    { value = "${module.core_melbourne.public_subnet_id}"}
output "melb_Standard_LRS"        { value = "${module.core_melbourne.Standard_LRS}" }
output "melb_Standard_ZRS"        { value = "${module.core_melbourne.Standard_ZRS}" }
output "melb_Standard_GRS"        { value = "${module.core_melbourne.Standard_GRS}" }
output "melb_Standard_RAGRS"      { value = "${module.core_melbourne.Standard_RAGRS}" }
output "melb_Premium_LRS"         { value = "${module.core_melbourne.Premium_LRS}" }

output "syd_resource_group_name" { value = "${module.core_sydney.resource_group_name}"}
output "syd_location"            { value = "${module.core_sydney.location}"}
output "syd_edge_subnet_id"      { value = "${module.core_sydney.edge_subnet_id}"}
output "syd_private_subnet_id"   { value = "${module.core_sydney.private_subnet_id}"}
output "syd_public_subnet_id"    { value = "${module.core_sydney.public_subnet_id}"}
output "syd_Standard_LRS"        { value = "${module.core_sydney.Standard_LRS}" }
output "syd_Standard_ZRS"        { value = "${module.core_sydney.Standard_ZRS}" }
output "syd_Standard_GRS"        { value = "${module.core_sydney.Standard_GRS}" }
output "syd_Standard_RAGRS"      { value = "${module.core_sydney.Standard_RAGRS}" }
output "syd_Premium_LRS"         { value = "${module.core_sydney.Premium_LRS}" }