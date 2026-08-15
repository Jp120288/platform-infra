# VPC module
module "vpc" {
  source = "../../modules/vpc"

  name = "platform-${var.environment}"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

  enable_nat_gateway = true
  single_nat_gateway = true
}

# EKS module
module "eks" {
  source = "../../modules/eks"

  cluster_name = "platform-dev-eks"

  kubernetes_version = "1.36"

  vpc_id = module.vpc.vpc_id

  private_subnet_ids = module.vpc.private_subnet_ids

  node_instance_types = [
    "t3.small"
  ]

  node_desired_size = 2
  node_min_size     = 2
  node_max_size     = 3
}