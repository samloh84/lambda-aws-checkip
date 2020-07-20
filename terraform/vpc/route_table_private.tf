resource "aws_route_table" "private_route_tables" {
  count = length(aws_subnet.private_subnets)
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.private_subnet_nat_gateways[count.index].id
  }

  vpc_id = aws_vpc.vpc.id
  tags = module.private_route_table_tags.tags
}


resource "aws_route_table_association" "private_route_table_associations" {
  count = length(aws_subnet.private_subnets)
  route_table_id = aws_route_table.private_route_tables[count.index].id
  subnet_id = aws_subnet.private_subnets[count.index].id
}
