module "minimal" {
  source = "../"

  repo_name           = ""
  ecsServiceRole_arn  = ""
  ecsInstanceRole_arn = ""
  cd_user_arn         = ""
}

module "full" {
  source = "../"

  repo_name             = ""
  ecsServiceRole_arn    = ""
  ecsInstanceRole_arn   = ""
  cd_user_arn           = ""
  force_delete          = false
  image_retention_count = 0
  image_retention_tags  = []
}

output "repo_url" {
  value = module.minimal.repo_url
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0, < 6.0.0"
    }
  }
}
