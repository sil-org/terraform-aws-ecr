variable "repo_name" {
  description = <<-EOT
    The name of the ECR repository. The repository name may container a maximum of 256 characters. The name must
    start with a letter and can only contain lowercase letters, numbers, hyphens, underscores, periods and forward
    slashes. Using a double forward slash isn't supported.
  EOT
  type        = string
}

variable "instance_role_arn" {
  description = "The ECS instance role for the EC2 instance. This role will be given permission to pull images."
  type        = string
  default     = null
}

variable "cd_principal_arn" {
  description = "The ARN of the user or role that will be given push/pull permission for continuous deployment."
  type        = string
}

variable "force_delete" {
  description = "When deleting this ECR repository, whether to proceed even if it contains images."
  type        = bool
  default     = null
}

variable "image_retention_count" {
  description = "The number of images to retain. Used in the lifecycle policy. If 0, no policy is created."
  type        = number
  default     = 0
}

variable "image_retention_tags" {
  description = "Additional image tags to retain regardless of age. Used in the lifecycle policy."
  type        = list(string)
  default     = ["latest"]
}
