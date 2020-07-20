resource "aws_lambda_function" "lambda_function" {
  function_name = module.tags.name
  handler = var.handler
  role = aws_iam_role.iam_role.arn
  runtime = "nodejs12.x"
  filename = var.lambda_zip_path
  source_code_hash = filebase64sha256(var.lambda_zip_path)
  timeout = var.timeout



  tags = module.tags.tags
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "${module.apigatewayv2_tags.name}_invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.api.execution_arn}/*/*/*"
}