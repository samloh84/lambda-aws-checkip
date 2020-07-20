resource "aws_iam_role" "iam_role" {
  name = module.iam_role_tags.name
  path = "/${var.common_tags.project}/"
  assume_role_policy = data.aws_iam_policy_document.iam_policy_assume_role.json

  force_detach_policies = true

  tags = module.iam_role_tags.tags
}

resource "aws_iam_policy" "iam_policy" {
  name = module.iam_policy.name
  path = "/${var.common_tags.project}/"
  policy = data.aws_iam_policy_document.iam_policy.json
}
