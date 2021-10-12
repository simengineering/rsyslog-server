# The root compartment/tenancy id. used to find the compartments ids the instance will be deployed in.
variable "root_compartment_id" {}

# The compartment id for the NSG.
variable "compartment_id" {}

# The VCN id where the NSG will be deployed
variable "vcn_id" {}

# The environment abbreviation for the deployment. e.g. znc for Zone C.
variable "env_abbr" {}

# The region abbreviation for the deployment. e.g. de for dod east.
variable "region_abbr" {}
