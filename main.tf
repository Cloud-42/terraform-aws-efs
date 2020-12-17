# --------------------------
# EFS FileSystem
# --------------------------
resource "aws_efs_file_system" "this" {
  encrypted        = var.efs_encrypted
  performance_mode = var.performance_mode
  kms_key_id       = var.efs_encrypted == true ? aws_kms_key.this.arn : null

  tags = var.tags
}

# --------------------------
# Mount points
# --------------------------
resource "aws_efs_mount_target" "subnet_a" {
  depends_on      = [aws_efs_file_system.this]
  count           = var.private_subnet_a != "" ? 1 : 0
  file_system_id  = aws_efs_file_system.this.id
  security_groups = var.security_groups_subnet_a
  subnet_id       = var.subnet_a
}

resource "aws_efs_mount_target" "subnet_b" {
  depends_on      = [aws_efs_file_system.this]
  count           = var.private_subnet_b != "" ? 1 : 0
  file_system_id  = aws_efs_file_system.this.id
  security_groups = var.security_groups_subnet_a
  subnet_id       = var.subnet_b
}
