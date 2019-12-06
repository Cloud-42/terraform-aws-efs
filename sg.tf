# --------------------------
# EFS Security Groups
# --------------------------
resource "aws_security_group" "private_subnet_a" {
  count       = var.private_subnet_a != "" ? 1 : 0
  name        = "${var.environment}.${var.build_ref}.efs.subnet.a.sg"
  description = "Security group for controlling access to EFS from subnet A"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.subnet_a_ip_range]
  }

  tags = {
    "environment"   = var.environment
    "contact"       = var.contact
    "orchestration" = var.orchestration
  }
}

resource "aws_security_group" "private_subnet_b" {
  count       = var.private_subnet_b != "" ? 1 : 0
  name        = "${var.environment}.${var.build_ref}.efs.subnet.b.sg"
  description = "Security group for controlling access to EFS from subnet B"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.subnet_b_ip_range]
  }

  tags = {
    "environment"   = var.environment
    "contact"       = var.contact
    "orchestration" = var.orchestration
  }
}

