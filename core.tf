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
  source = "git@github.com:WestpacCloudEngineering/tf-module-azure-core.git"

  account_name = "${var.environment}coresyd"
  location = "Australia East"

  network_address_space = "${var.sydney_network_address_space}"
  public_address_space  = "${var.sydney_public_address_space}"
  private_address_space = "${var.sydney_private_address_space}"
  edge_address_space    = "${var.sydney_edge_address_space}"
}

module core_melbourne {
  source = "git@github.com:WestpacCloudEngineering/tf-module-azure-core.git"

  account_name = "${var.environment}coremelb"
  location = "Australia Southeast"

  network_address_space = "${var.sydney_network_address_space}"
  public_address_space  = "${var.sydney_public_address_space}"
  private_address_space = "${var.sydney_private_address_space}"
  edge_address_space    = "${var.sydney_edge_address_space}"
}