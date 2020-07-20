resource "aws_subnet" "private_subnets" {
  count = length(var.availability_zones)
  cidr_block = local.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = false
  vpc_id = aws_vpc.vpc.id

  tags = module.private_subnet_tags.tags
}

