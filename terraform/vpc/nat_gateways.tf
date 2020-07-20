resource "aws_eip" "private_subnet_nat_gateway_eips" {
  count = length(aws_subnet.private_subnets)
  vpc = true
  tags = module.nat_gateway_eip_tags.tags
  depends_on = [
    aws_internet_gateway.internet_gateway]
}

resource "aws_nat_gateway" "private_subnet_nat_gateways" {
  count = length(aws_subnet.private_subnets)
  allocation_id = aws_eip.private_subnet_nat_gateway_eips[count.index].id
  subnet_id = aws_subnet.private_subnets[count.index].id

  depends_on = [aws_eip.private_subnet_nat_gateway_eips]

  tags = module.private_subnet_tags.tags
}
