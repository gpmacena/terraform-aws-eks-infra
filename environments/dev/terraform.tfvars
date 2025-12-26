aws_region = "sa-east-1"

cluster_name = "eks-dev"

vpc_cidr = "10.0.0.0/16"

public_subnets = {
  public-1 = {
    cidr = "10.0.1.0/24"
    az   = "sa-east-1a"
  }
  public-2 = {
    cidr = "10.0.2.0/24"
    az   = "sa-east-1b"
  }
}

private_subnets = {
  private-1 = {
    cidr = "10.0.101.0/24"
    az   = "sa-east-1a"
  }
  private-2 = {
    cidr = "10.0.102.0/24"
    az   = "sa-east-1b"
  }
}