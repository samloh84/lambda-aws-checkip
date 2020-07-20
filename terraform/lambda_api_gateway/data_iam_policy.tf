
data "aws_iam_policy_document" "iam_policy" {
  statement {
    actions = [
      "ec2:Describe*"]
    resources = ["*"]
    effect = "Allow"
  }

  statement {
    actions = [
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:DeleteSecurityGroup",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:RevokeSecurityGroupIngress"]
    effect = "Allow"
    resources = [
      "arn:aws:ec2:*:*:security-group/*"]
    condition {
      test = "ArnEquals"
      values = [
        "arn:aws:ec2:*:*:vpc/vpc-${var.vpc_id}"]
      variable = "ec2:Vpc"
    }

  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams"]
    resources = [
      aws_cloudwatch_log_group.lambda.arn]
    effect = "Allow"
  }
}

