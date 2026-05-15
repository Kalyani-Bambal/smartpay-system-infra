env             = "dev"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]
azs             = ["ap-south-1a", "ap-south-1b"]
tags = {
  Env = "dev"
}

cluster_name        = "smartpay-cluster"
cluster_version     = "1.34"
desired_size        = 3
max_size            = 3
min_size            = 1
node_instance_types = ["t3.small"]
allowed_cidr_blocks = ["10.10.0.0/16"]  # VPC CIDR (bastion included
common_tags = {
  "Project"     = "TerraformInfra"
  "Environment" = "Development"
}

bastion_assume_role_principals = [
  "arn:aws:iam::358871393576:user/Ashutosh-Bambal",
  "arn:aws:iam::358871393576:user/Kalyani-Bambal"
]