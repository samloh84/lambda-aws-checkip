resource "aws_iam_policy" "iam_policy" {
  name = module.iam_policy_tags.name
  path = "/${var.common_tags.project}/"
  policy = data.aws_iam_policy_document.iam_policy.json
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  policy_arn = aws_iam_policy.iam_policy.arn
  role = aws_iam_role.iam_role.id
}

resource "aws_iam_role" "iam_role" {
  name = module.iam_role_tags.name
  path = "/${var.common_tags.project}/"

  assume_role_policy = data.aws_iam_policy_document.iam_policy_assume_role.json
  tags = module.iam_role_tags.tags
}
