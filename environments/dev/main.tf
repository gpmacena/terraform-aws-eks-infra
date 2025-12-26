module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr        = var.vpc_cidr
  cluster_name    = var.cluster_name
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "eks" {
  source = "../../modules/eks"

  cluster_name = var.cluster_name
  subnet_ids   = module.vpc.private_subnet_ids
}
