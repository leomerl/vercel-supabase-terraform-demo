# Tenant B configuration

terraform {
  source = "../../modules/tenant"
}

include "root" {
  path = find_in_parent_folders()
}

# Load common configuration and tenant-specific variables
locals {
  common_vars = read_terragrunt_config("../../common/common.hcl")
  tenant_vars = read_terragrunt_config("vars.hcl")
}

# Merge common inputs with tenant-specific inputs
inputs = merge(
  local.common_vars.locals.common_inputs,
  local.tenant_vars.locals,
  {
    tenant_name = "tenant-b"
  }
)