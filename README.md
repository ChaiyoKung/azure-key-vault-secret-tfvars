# Azure Key Vault Secret tfvars

## Getting Started

Login to Azure.

```bash
az login
```

Initialize the Terraform configuration.

```bash
terraform init
```

## Development

Create a plan.

```bash
terraform plan -no-color -out tfplan > tfplan.txt
```

Apply the plan.

```bash
terraform apply "tfplan"
```
