module "tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "lambda_function"
  custom_tags = var.custom_tags
}


module "apigatewayv2_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "apigatewayv2"
  custom_tags = var.custom_tags
}

module "cloudwatch_log_group_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "cloudwatch_log_group"
  custom_tags = var.custom_tags
}


module "iam_policy_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "iam_policy"
  custom_tags = var.custom_tags
}

module "iam_role_tags" {
  source = "../__tags"
  common_tags = var.common_tags
  resource_name = var.name
  resource_type = "iam_role"
  custom_tags = var.custom_tags
}
