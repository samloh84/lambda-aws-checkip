resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support = var.vpc_enable_dns_support

  tags = module.tags.tags
}

locals {
  num_az = length(var.availability_zones)
  num_subnets = local.num_az*2
  subnet_size = pow(2, ceil(log(local.num_subnets, 10)/log(2, 10)))
  subnet_cidrs = [for i in range(local.num_subnets):cidrsubnet(aws_vpc.vpc.cidr_block, local.subnet_size, i)]
  public_subnet_cidrs = coalescelist(var.public_subnet_cidrs, [for i in range(local.num_az):local.subnet_cidrs[i]])
  private_subnet_cidrs = coalescelist(var.private_subnet_cidrs, [for i in range(local.num_az, local.num_subnets):local.subnet_cidrs[i]])
}

