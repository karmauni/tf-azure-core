#############################
## Variables
#############################
variable sydney_network_address_space     { type = "list"   }  # CIDR Address Space
variable sydney_public_address_space      { type = "string" }  
variable sydney_private_address_space     { type = "string" }  
variable sydney_data_address_space        { type = "string" }  

variable victoria_network_address_space   { type = "list"   }  # CIDR Address Space
variable victoria_public_address_space    { type = "string" }  
variable victoria_private_address_space   { type = "string" }  
variable victoria_data_address_space      { type = "string" }  

variable environment                      { type = "string" }

#############################
## Resource Group
#############################
module core_sydney {
  source = "github.com/WestpacCloudEngineering/tf-module-azure-core"

  account_name = "core-${var.environment}-syd"
  location = "Australia East"

  network_address_space = "${var.sydney_network_address_space}"
  public_address_space  = "${var.sydney_public_address_space}"
  private_address_space = "${var.sydney_private_address_space}"
  data_address_space    = "${var.sydney_data_address_space}"
}

module core_melbourne {
  source = "github.com/WestpacCloudEngineering/tf-module-azure-core"

  account_name = "core-${var.environment}-melb"
  location = "Australia Southeast"

  network_address_space = "${var.sydney_network_address_space}"
  public_address_space  = "${var.sydney_public_address_space}"
  private_address_space = "${var.sydney_private_address_space}"
  data_address_space    = "${var.sydney_data_address_space}"
}

#############################
## Resource Group
#############################

output "melbourne_resource_group_name" { value = "${module.core_melbourne.resource_group_name}"}
output "melbourne_location"            { value = "${module.core_melbourne.location}"}
output "melbourne_data_subnet_id"      { value = "${module.core_melbourne.data_subnet_id}"}
output "melbourne_private_subnet_id"   { value = "${module.core_melbourne.private_subnet_id}"}
output "melbourne_public_subnet_id"    { value = "${module.core_melbourne.public_subnet_id}"}

output "sydney_resource_group_name" { value = "${module.core_sydney.resource_group_name}"}
output "sydney_location"            { value = "${module.core_sydney.location}"}
output "sydney_data_subnet_id"      { value = "${module.core_sydney.data_subnet_id}"}
output "sydney_private_subnet_id"   { value = "${module.core_sydney.private_subnet_id}"}
output "sydney_public_subnet_id"    { value = "${module.core_sydney.public_subnet_id}"}
