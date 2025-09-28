# Vercel-Supabase-Terraform Demo

Infrastructure as Code examples for integrating Vercel and Supabase using Terraform.

## Providers

https://registry.terraform.io/providers/vercel/vercel/latest/docs/resources/deployment
https://registry.terraform.io/providers/supabase/supabase/latest/docs/resources/project

## Folders

- **01-supabase-project-setup** - Creating and configuring a Supabase project
- **02-vercel-project-setup** - Setting up a Vercel project deployment
- **03-vercel-dns-record** - Managing DNS records through Vercel
- **04-vercel-project-domain** - Configuring custom domains for Vercel projects
- **05-shared-env-vars-supa-vercel** - Sharing environment variables between Supabase and Vercel
- **06-all-together** - Complete integration combining all components
- **07-terragrunt** - Using Terragrunt for DRY configurations and module management
- **08-multi-tenancy** - Multi-tenant architecture with Terragrunt for managing multiple environments