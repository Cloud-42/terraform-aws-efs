# -------------------------------------------------------
# KMS Key for EFS
# -------------------------------------------------------
resource "aws_kms_key" "this" {
  description             = "This key is used to encrypt EFS in ${var.environment}"
  deletion_window_in_days = 30
}

# Alias
resource "aws_kms_alias" "this" {
  name          = var.kms_alias_name
  target_key_id = aws_kms_key.this[count.index].key_id
}

