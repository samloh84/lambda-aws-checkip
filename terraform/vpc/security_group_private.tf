resource "aws_security_group" "private_security_group" {
  name = module.private_security_group_tags.name
  description = "Private Security Group for App Tier"
  
  vpc_id = aws_vpc.vpc.id
  revoke_rules_on_delete = true

  tags = module.private_security_group_tags.tags
}


resource "aws_security_group_rule" "private_ssh_ingress_from_public" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.private_security_group.id
  source_security_group_id = aws_security_group.private_security_group.id
}

resource "aws_security_group_rule" "private_ssh_ingress_from_public_subnets" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = aws_subnet.public_subnets.*.cidr_block
  security_group_id = aws_security_group.private_security_group.id

}

resource "aws_security_group_rule" "private_rdp_tcp_ingress_from_public" {
  type = "ingress"
  from_port = 3389
  to_port = 3389
  protocol = "tcp"
  security_group_id = aws_security_group.private_security_group.id
  source_security_group_id = aws_security_group.private_security_group.id
}
resource "aws_security_group_rule" "private_rdp_tcp_ingress_from_public_subnets" {
  type = "ingress"
  from_port = 3389
  to_port = 3389
  protocol = "tcp"
  security_group_id = aws_security_group.private_security_group.id
  cidr_blocks = aws_subnet.public_subnets.*.cidr_block
}

resource "aws_security_group_rule" "private_rdp_udp_ingress_from_public" {
  type = "ingress"
  from_port = 3389
  to_port = 3389
  protocol = "udp"
  security_group_id = aws_security_group.private_security_group.id
  source_security_group_id = aws_security_group.private_security_group.id
}

resource "aws_security_group_rule" "private_rdp_udp_ingress_from_public_subnets" {
  type = "ingress"
  from_port = 3389
  to_port = 3389
  protocol = "udp"
  security_group_id = aws_security_group.private_security_group.id
  cidr_blocks = aws_subnet.public_subnets.*.cidr_block
}


resource "aws_security_group_rule" "private_https_ingress_from_public" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = aws_security_group.private_security_group.id
  source_security_group_id = aws_security_group.private_security_group.id
}

resource "aws_security_group_rule" "private_https_ingress_from_public_subnets" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = aws_security_group.private_security_group.id
  cidr_blocks = aws_subnet.public_subnets.*.cidr_block
}


resource "aws_security_group_rule" "private_all_ingress_from_private" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.private_security_group.id
  source_security_group_id = aws_security_group.private_security_group.id
}

resource "aws_security_group_rule" "private_all_egress_to_internet" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.private_security_group.id
  cidr_blocks = [
    "0.0.0.0/0"]
}

