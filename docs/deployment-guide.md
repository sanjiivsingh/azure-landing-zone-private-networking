# Deployment Guide: Private Networking Landing Zone

## Prerequisites
- Terraform `>= 1.9.0`
- Azure CLI with `Network Contributor` role.

## Deployment Steps
```bash
cd environments/dev
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```
