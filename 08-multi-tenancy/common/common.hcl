# Common configuration shared across all tenants

locals {
  # Load environment variables - using relative path from common directory
  env_vars = read_terragrunt_config("../env.hcl")

  # Common inputs for all tenants
  common_inputs = {
    supabase_access_token    = local.env_vars.locals.supabase_access_token
    supabase_organization_id = local.env_vars.locals.supabase_organization_id
    vercel_api_token        = local.env_vars.locals.vercel_api_token
    region                  = try(local.env_vars.locals.region, "us-east-1")
    framework               = try(local.env_vars.locals.framework, "nextjs")
  }
}