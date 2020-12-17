# --------------------------
# EFS FileSystem
# --------------------------
resource "aws_efs_file_system" "this" {
  encrypted        = true
  performance_mode = var.performance_mode
  kms_key_id       = aws_kms_key.this.arn

  tags = var.tags
}

# --------------------------
# Mount points
# --------------------------
resource "aws_efs_mount_target" "subnet_a" {
  depends_on      = [aws_efs_file_system.this]
  count           = var.subnet_a != "" ? 1 : 0
  file_system_id  = aws_efs_file_system.this.id
  security_groups = var.security_group_subnet_a
  subnet_id       = var.subnet_a
}

resource "aws_efs_mount_target" "subnet_b" {
  depends_on      = [aws_efs_file_system.this]
  count           = var.subnet_b != "" ? 1 : 0
  file_system_id  = aws_efs_file_system.this.id
  security_groups = var.security_group_subnet_a
  subnet_id       = var.subnet_b
}
