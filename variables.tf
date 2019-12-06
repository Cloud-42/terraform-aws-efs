# ---------------------------
# EFS Vars
# ---------------------------
variable "orchestration" {
}

variable "vpc_id" {
}

variable "environment" {
}

variable "contact" {
}

variable "efs_encrypted" {
  description = "Encrypt the EFS share"
  default     = "true"
}

variable "build_ref" {
  description = "Build reference to allow for unique names to be generated"
  default     = null
}

variable "performance_mode" {
  description = "EFS performance mode.https://docs.aws.amazon.com/efs/latest/ug/performance.html"
  default     = "generalPurpose"
}

variable "private_subnet_a" {
  description = "1st private subnet id"
}

variable "private_subnet_b" {
  description = "2nd private subnet id"
}

variable "subnet_a_ip_range" {
  description = "1st subnet IP range, grants access to EFS mount point a"
}

variable "subnet_b_ip_range" {
  description = "2nd subnet IP range, grants access to EFS mount point b"
}

