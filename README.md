# aws/ecr - EC2 Container Service Image Repository
This module is used to create an ECS image repository for storage of a Docker
image.

## What this does

- Create ECR repository named `var.repo_name`
- Attach ECR policy to allow appropriate access

This module is published in [Terraform Registry](https://registry.terraform.io/modules/sil-org/ecr/aws/latest).

## Usage Example

```hcl
module "ecr" {
  source  = "sil-org/ecr/aws"
  version = "~> 0.3.0"
  
  repo_name             = "${var.app_name}-${var.app_env}"
  instance_role_arn     = "arn:aws:iam::111111111111:role/instance-role-01ab23cd"
  cd_principal_arn      = "arn:aws:iam::111111111111:role/cd-role-01ab23cd"
  force_delete          = true
  image_retention_count = 10
  image_retention_tags  = ["latest", "main"]
}
```
