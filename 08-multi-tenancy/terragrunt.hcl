# Root terragrunt configuration

locals {
  # Parse the environment variables if they exist
  # No need to load env.hcl here, it's loaded in common.hcl
}

# Configure Terraform remote state storage
remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    path = "${get_parent_terragrunt_dir()}/terraform.tfstate.d/${path_relative_to_include()}/terraform.tfstate"
  }
}