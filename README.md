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
  version = "~> 0.1.0"
  
  repo_name             = "${var.app_name}-${var.app_env}"
  ecsInstanceRole_arn   = "${data.terraform_remote_state.cluster.ecsInstanceRole_arn}"
  ecsServiceRole_arn    = "${data.terraform_remote_state.cluster.ecsServiceRole_arn}"
  cd_user_arn           = "${data.terraform_remote_state.cluster.cd_user_arn}"
  force_delete          = true
  image_retention_count = 10
  image_retention_tags  = ["latest", "main", "develop"]
}
```
