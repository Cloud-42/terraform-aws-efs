# -------------------------------------------------------
# KMS Key for EFS
# -------------------------------------------------------
resource "aws_kms_key" "efskey" {
  description             = "This key is used to encrypt EFS in ${var.environment}"
  deletion_window_in_days = 30
}

#
# Alias
#

resource "aws_kms_alias" "efs" {
  name          = "alias/efs-${var.environment}-${var.build_ref}"
  target_key_id = aws_kms_key.efskey.key_id
}

