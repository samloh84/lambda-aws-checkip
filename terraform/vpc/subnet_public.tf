resource "aws_subnet" "public_subnets" {
  count = length(var.availability_zones)
  cidr_block = local.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.vpc.id

  tags = module.public_subnet_tags.tags
}

