resource "aws_flow_log" "example" {
  iam_role_arn    = aws_iam_role.iam_role.arn
  log_destination = aws_cloudwatch_log_group.cloudwatch_log_group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = module.cloudwatch_log_group_tags.name
  tags = module.cloudwatch_log_group_tags.tags
}
