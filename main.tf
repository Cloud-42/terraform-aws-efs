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
resource "aws_efs_mount_target" "this" {
  count          = length(var.subnet_ids) > 0 ? length(var.subnet_ids) : 0
  file_system_id = aws_efs_file_system.this.id
  subnet_id      = var.subnet_ids[count.index]
  security_groups = [
    var.security_group_id
  ]
}
