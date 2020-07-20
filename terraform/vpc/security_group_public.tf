
resource "aws_security_group" "public_security_group" {
  name = module.public_security_group_tags.name
  description = "Public Security Group for Web Tier"

  vpc_id = aws_vpc.vpc.id
  revoke_rules_on_delete = true

  tags = module.public_security_group_tags.tags
}


resource "aws_security_group_rule" "public_https_ingress_from_whitelisted_cidrs" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = aws_security_group.public_security_group.id
  cidr_blocks = coalescelist(var.whitelisted_public_cidrs, [
    local.local_cidr])


}

resource "aws_security_group_rule" "public_ssh_ingress_from_whitelisted_cidrs" {
  count = var.allow_public_ssh ? 1 : 0
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.public_security_group.id
  cidr_blocks = coalescelist(var.whitelisted_public_cidrs, [
    local.local_cidr])
}


resource "aws_security_group_rule" "public_all_ingress_from_public" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.public_security_group.id
  source_security_group_id = aws_security_group.public_security_group.id
}

resource "aws_security_group_rule" "public_all_egress_to_internet" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.public_security_group.id
  cidr_blocks = [
    "0.0.0.0/0"]
}

