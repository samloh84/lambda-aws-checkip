resource "aws_route_table" "public_route_table" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  vpc_id = aws_vpc.vpc.id
  tags = module.public_route_table_tags.tags
}


resource "aws_route_table_association" "public_route_table_associations" {
  count = length(aws_subnet.public_subnets)
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnets[count.index].id
}

