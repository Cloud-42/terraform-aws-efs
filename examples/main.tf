module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.65.0"

  name = "dev"
  cidr = "172.16.0.0/16"

  azs                = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets    = ["172.16.0.0/19", "172.16.32.0/19", "172.16.64.0/19"]
  public_subnets     = ["172.16.128.0/19", "172.16.160.0/19", "172.16.192.0/19"]
  enable_nat_gateway = true

  tags = var.tags
}

module "sg-efs" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.17.0"

  name        = "efs-sg"
  description = "Security group for EFS"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["nfs-tcp"]
  egress_rules        = ["all-all"]
}

module "efs" {
  source  = "Cloud-42/efs/aws"
  version = "3.0.0"

  environment       = var.dev
  vpc_id            = module.vpc.vpc_id
  security_group_id = module.sg-efs.this_security_group_id
  subnet_ids        = module.vpc.private_subnets

  tags = var.tags
}
