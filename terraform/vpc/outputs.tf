
output "vpc" {
  value = aws_vpc.vpc
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_security_group" {
  value = aws_security_group.private_security_group
}

output "private_security_group_id" {
  value = aws_security_group.private_security_group.id
}

output "public_security_group" {
  value = aws_security_group.public_security_group
}

output "public_security_group_id" {
  value = aws_security_group.public_security_group.id
}

output "private_subnets" {
  value = aws_subnet.private_subnets
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets.*.id
}

output "public_subnets" {
  value = aws_subnet.public_subnets
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets.*.id
}

output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "private_route_table_ids" {
  value = aws_route_table.private_route_tables.*.id
}
