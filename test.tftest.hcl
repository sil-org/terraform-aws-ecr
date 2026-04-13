mock_provider "aws" {}

variables {
  repo_name        = "test_repo"
  cd_principal_arn = "arn:aws:iam::111111111111:role/cd-role-01ab23cd"
}

run "test" {
  assert {
    condition     = aws_ecr_repository.repo.name == "test_repo"
    error_message = "incorrect repo name"
  }

  assert {
    condition     = !strcontains(aws_ecr_repository_policy.this.policy, "ECS Pull Access")
    error_message = "incorrect repo policy"
  }

}

run "include_instance_role" {
  variables {
    instance_role_arn = "arn:aws:iam::111111111111:role/instance-role-01ab23cd"
  }

  assert {
    condition     = strcontains(aws_ecr_repository_policy.this.policy, "ECS Pull Access")
    error_message = "incorrect repo policy"
  }
}

run "include_all" {
  variables {
    instance_role_arn     = "arn:aws:iam::111111111111:role/instance-role-01ab23cd"
    force_delete          = false
    image_retention_count = 10
    image_retention_tags  = ["latest", "prod"]
  }
}
