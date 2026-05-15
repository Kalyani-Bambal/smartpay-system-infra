#vpc Module

module "vpc" {
  source = "git::https://github.com/Kalyani-Bambal/smartpay-system-modules.git//modules/vpc?ref=main"

  # name = "smartpay-dev-vpc"    
  env             = var.env
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  tags            = var.tags
}

#EKS Module

module "eks" {

  source = "git::https://github.com/Kalyani-Bambal/smartpay-system-modules.git//modules/eks?ref=main"
  env             = var.env
  cluster_name    = "${var.env}-eks"
  cluster_version = var.cluster_version

  vpc_id              = module.vpc.aws_vpc
  private_subnet_ids  = module.vpc.private_subnet_ids
  desired_size        = var.desired_size
  max_size            = var.max_size
  min_size            = var.min_size
  node_instance_types = var.node_instance_types

  allowed_cidr_blocks = var.allowed_cidr_blocks
  bastion_access_role_arn = module.bastion.bastion_access_role_arn
  tags = var.tags
}
