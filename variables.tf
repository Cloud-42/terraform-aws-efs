variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "environment" {
  type        = string
  description = "Environment id. UAT, TEST, PRD, etc"
}

variable "deletion_window_in_days" {
  type        = number
  description = "Duration in days after which the key is deleted after destruction of the resource"
  default     = 30
}

variable "enable_key_rotation" {
  type        = bool
  description = "Whether or not automated key rotation is enabled"
  default     = true
}
variable "policy" {
type        = string
  description = "JSON document defining KMS policy, must be valid"
  default     = ""
}

variable "performance_mode" {
  description = "EFS performance mode.https://docs.aws.amazon.com/efs/latest/ug/performance.html"
  default     = "generalPurpose"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ids into which EFS is deployed"
}
variable "kms_alias_name" {
  description = "KMS alias name to use"
  default     = "alias/efs"
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
  default     = {}
}

variable "security_group_id" {
  type        = string
  description = "Security group to assign to the mount point(s)"
}
