
data "aws_iam_policy_document" "iam_policy_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = [ "vpc-flow-logs.amazonaws.com"]
      type = "Service"
    }
    effect = "Allow"
    sid = ""
  }
}
