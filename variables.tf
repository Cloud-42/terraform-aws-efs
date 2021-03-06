# ---------------------------
# EFS Vars
# ---------------------------
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

variable "performance_mode" {
  description = "EFS performance mode.https://docs.aws.amazon.com/efs/latest/ug/performance.html"
  default     = "generalPurpose"
}

variable "subnet_a" {
  type        = string
  description = "1st subnet id into which EFS is deployed"
}

variable "subnet_b" {
  type        = string
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
  type        = list(string)
  description = "Security group to assign to mount point in subnet a"
}

variable "security_group_subnet_b" {
  type        = list(string)
  description = "Security group to assign to mount point in subnet a"
}

