# Multi-Tenancy Configuration with Terragrunt

This directory contains a multi-tenancy setup for deploying Vercel and Supabase projects using Terragrunt.

## Directory Structure

```
08-multi-tenancy/
├── terragrunt.hcl          # Root Terragrunt configuration
├── env.hcl.example         # Example environment variables
├── modules/
│   └── tenant/            # Shared Terraform module for all tenants
│       ├── main.tf        # Supabase + Vercel resources
│       ├── variables.tf   # Module variables
│       ├── outputs.tf     # Module outputs
│       └── providers.tf   # Provider configuration
├── tenants/
│   ├── tenant-a/          # Tenant A configuration
│   │   ├── terragrunt.hcl
│   │   └── vars.hcl
│   ├── tenant-b/          # Tenant B configuration
│   │   ├── terragrunt.hcl
│   │   └── vars.hcl
│   └── tenant-c/          # Tenant C configuration
│       ├── terragrunt.hcl
│       └── vars.hcl
└── common/
    └── common.hcl         # Common configuration for all tenants
```

## Setup Instructions

1. **Configure Environment Variables**
   ```bash
   cp env.hcl.example env.hcl
   # Edit env.hcl with your actual API tokens and organization IDs
   ```

2. **Update Tenant-Specific Variables**
   Edit each tenant's `vars.hcl` file to configure:
   - `project_name`: The base name for the project
   - `database_password`: Secure password for the Supabase database
   - `domain`: Custom domain for the Vercel project
   - `git_repository`: Optional GitHub repository (format: "username/repo")

## Deployment Commands

### Deploy All Tenants
```bash
terragrunt run-all apply
```

### Deploy a Specific Tenant
```bash
cd tenants/tenant-a
terragrunt apply
```

### Plan Changes for All Tenants
```bash
terragrunt run-all plan
```

### Destroy a Specific Tenant's Infrastructure
```bash
cd tenants/tenant-a
terragrunt destroy
```

## Features

- **Isolated State**: Each tenant maintains its own Terraform state file
- **Shared Module**: Common infrastructure code is reused across all tenants
- **Environment Separation**: Each tenant gets its own Supabase project and Vercel deployment
- **Custom Domains**: Each tenant can have its own custom domain
- **Environment Variables**: Automatic configuration of Supabase credentials in Vercel

## Adding New Tenants

To add a new tenant:

1. Create a new directory under `tenants/`
2. Copy the `terragrunt.hcl` from another tenant and update the `tenant_name`
3. Create a `vars.hcl` file with tenant-specific variables
4. Run `terragrunt apply` in the new tenant directory

## Important Notes

- **Passwords**: Always use strong, unique passwords for each tenant's database
- **API Tokens**: Keep your API tokens secure and never commit them to version control
- **State Files**: The current configuration uses local state. For production, configure remote state storage (S3, GCS, etc.)
- **Costs**: Each tenant will create separate Supabase and Vercel projects, which may incur costs