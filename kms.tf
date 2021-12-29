# -------------------------------------------------------
# KMS Key for EFS
# -------------------------------------------------------
resource "aws_kms_key" "this" {
  description             = "This key is used to encrypt EFS in ${var.environment}"
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = var.policy
  tags                    = var.tags

}

# Alias
resource "aws_kms_alias" "this" {
  name          = var.kms_alias_name
  target_key_id = aws_kms_key.this.key_id
}
