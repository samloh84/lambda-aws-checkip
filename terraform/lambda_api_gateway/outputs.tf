output "lambda_function" {
  value = aws_lambda_function.lambda_function
}

output "lambda_function_name" {
  value = aws_lambda_function.lambda_function.function_name
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.lambda
}

output "iam_policy" {
  value = aws_iam_policy.iam_policy
}

output "iam_role" {
  value = aws_iam_role.iam_role
}

output "api_endpoint" {
  value = aws_apigatewayv2_api.api.api_endpoint
}

