# Supabase Project Setup with Terraform

To run the Terraform configuration:

1. **Copy and fill the example file**:
```bash
cp terraform.tfvars.example terraform.tfvars
```
Then edit `terraform.tfvars` with your actual values.

2. **Initialize Terraform** (downloads the Supabase provider):
```bash
terraform init
```

3. **Preview what will be created**:
```bash
terraform plan
```

4. **Create the Supabase project**:
```bash
terraform apply
```
Type `yes` when prompted to confirm.

5. **View the outputs** (after successful apply):
```bash
terraform output
# Or for specific outputs:
terraform output -raw supabase_api_key
terraform output -raw supabase_database_url
```

**To destroy** the project when done:
```bash
terraform destroy
```

**Note**: Since the outputs are marked as sensitive, use `-raw` flag or `-json` to see the actual values:
```bash
terraform output -json
```