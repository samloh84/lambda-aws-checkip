module "tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "vpc"
  custom_tags = var.custom_tags
}

module "private_subnet_tags" {

  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "private_subnet"
  custom_tags = var.custom_tags
}
// substr(var.availability_zones[count.index], length(var.availability_zones[count.index]) - 2, 2)

module "public_subnet_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "public_subnet"
  custom_tags = var.custom_tags
}

module "internet_gateway_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "internet_gateway"
  custom_tags = var.custom_tags
}

module "nat_gateway_eip_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "nat_gateway_eip"
  custom_tags = var.custom_tags
}


module "public_route_table_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "public_route_table"
  custom_tags = var.custom_tags
}

module "private_route_table_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "private_route_table"
  custom_tags = var.custom_tags
}

module "public_security_group_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "public_security_group"
  custom_tags = var.custom_tags
}

module "private_security_group_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "private_security_group"
  custom_tags = var.custom_tags
}


module "iam_role_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "iam_role"
  custom_tags = var.custom_tags
}


module "iam_policy" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "iam_policy"
}


module "cloudwatch_log_group_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "log_group"
  custom_tags = var.custom_tags
}
