# stw-tf-public-ip

Terraform module that generates one or more Azure Public IP addresses. Reusable for Bastion and NAT Gateway.

## Usage

```hcl
module "public_ip" {
  source = "git::https://github.com/yasinwaad/stw-tf-public-ip.git?ref=v1.0.0"

  project_name        = "example"
  environment         = "dev"
  owner               = "Yasin"
  resource_group_name = "rg-example-dev-southafricanorth"

  public_ips = {
    bastion = {}
    nat     = {}
  }
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| project_name | Project name used in resource names | string | n/a |
| environment | Environment name, e.g. prod | string | n/a |
| owner | Owner tag value | string | n/a |
| resource_group_name | Name of the existing resource group | string | n/a |
| location | Azure region (only southafricanorth allowed) | string | southafricanorth |
| public_ips | Map of public IPs, key is used in the name | map(object) | {} |

Each entry in `public_ips` accepts `allocation_method` (default `Static`) and `sku` (default `Standard`).

## Outputs

| Name | Description |
|------|-------------|
| public_ip_ids | Map of public IP IDs, keyed by public_ips key |
| public_ip_addresses | Map of public IP addresses, keyed by public_ips key |

## Naming

Names are generated internally as `pip-<key>-<project_name>-<environment>-<location>`.