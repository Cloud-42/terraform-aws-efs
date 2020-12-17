# ---------------------------
# EFS Vars
# ---------------------------
variable "vpc_id" {}

variable "environment" {}

variable "efs_encrypted" {
  type = bool
  description = "Encrypt the EFS share?"
  default     = true
}

variable "performance_mode" {
  description = "EFS performance mode.https://docs.aws.amazon.com/efs/latest/ug/performance.html"
  default     = "generalPurpose"
}

variable "subnet_a" {
  description = "1st subnet id into which EFS is deployed"
}

variable "subnet_b" {
  description = "2nd subnet id into which EFS is deployed"
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

variable "security_group_subnet_a" {
  type        = string
  description = "Security group to assign to mount point in subnet a"
}

variable "security_group_subnet_b" {
  type        = string
  description = "Security group to assign to mount point in subnet a"
}

