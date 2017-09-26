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
  source = "github.com/WestpacCloudEngineering/tf-module-azure-core"

  account_name = "${var.environment}coresyd"
  location = "Australia East"

  network_address_space = "${var.sydney_network_address_space}"
  public_address_space  = "${var.sydney_public_address_space}"
  private_address_space = "${var.sydney_private_address_space}"
  edge_address_space    = "${var.sydney_edge_address_space}"
}

module core_melbourne {
  source = "github.com/WestpacCloudEngineering/tf-module-azure-core"

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

output "melbourne_resource_group_name" { value = "${module.core_melbourne.resource_group_name}"}
output "melbourne_location"            { value = "${module.core_melbourne.location}"}
output "melbourne_edge_subnet_id"      { value = "${module.core_melbourne.edge_subnet_id}"}
output "melbourne_private_subnet_id"   { value = "${module.core_melbourne.private_subnet_id}"}
output "melbourne_public_subnet_id"    { value = "${module.core_melbourne.public_subnet_id}"}
output "melbourne_Standard_LRS"        { value = "${module.core_melbourne.Standard_LRS}" }
output "melbourne_Standard_ZRS"        { value = "${module.core_melbourne.Standard_ZRS}" }
output "melbourne_Standard_GRS"        { value = "${module.core_melbourne.Standard_GRS}" }
output "melbourne_Standard_RAGRS"      { value = "${module.core_melbourne.Standard_RAGRS}" }
output "melbourne_Premium_LRS"         { value = "${module.core_melbourne.Premium_LRS}" }

output "sydney_resource_group_name" { value = "${module.core_sydney.resource_group_name}"}
output "sydney_location"            { value = "${module.core_sydney.location}"}
output "sydney_edge_subnet_id"      { value = "${module.core_sydney.edge_subnet_id}"}
output "sydney_private_subnet_id"   { value = "${module.core_sydney.private_subnet_id}"}
output "sydney_public_subnet_id"    { value = "${module.core_sydney.public_subnet_id}"}
output "sydney_Standard_LRS"        { value = "${module.core_sydney.Standard_LRS}" }
output "sydney_Standard_ZRS"        { value = "${module.core_sydney.Standard_ZRS}" }
output "sydney_Standard_GRS"        { value = "${module.core_sydney.Standard_GRS}" }
output "sydney_Standard_RAGRS"      { value = "${module.core_sydney.Standard_RAGRS}" }
output "sydney_Premium_LRS"         { value = "${module.core_sydney.Premium_LRS}" }