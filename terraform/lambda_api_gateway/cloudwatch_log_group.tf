
resource "aws_cloudwatch_log_group" "lambda" {
  name = "/aws/lambda/${module.tags.name}"
  tags = module.cloudwatch_log_group_tags.tags
}

resource "aws_cloudwatch_log_group" "apigatewayv2" {
  name = "apigatewayv2_${module.tags.name}"
  tags = module.cloudwatch_log_group_tags.tags
}