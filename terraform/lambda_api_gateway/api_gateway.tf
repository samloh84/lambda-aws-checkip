resource "aws_apigatewayv2_api" "api" {
  name = module.apigatewayv2_tags.name
  protocol_type = "HTTP"
  tags = module.apigatewayv2_tags.tags
}


resource "aws_apigatewayv2_integration" "api_integration" {
  api_id = aws_apigatewayv2_api.api.id
  integration_type = "AWS_PROXY"
  connection_type = "INTERNET"
  integration_method = "POST"
  integration_uri = aws_lambda_function.lambda_function.invoke_arn
  passthrough_behavior = "WHEN_NO_MATCH"
  payload_format_version = "2.0"

}

resource "aws_apigatewayv2_route" "route" {
  api_id = aws_apigatewayv2_api.api.id
  route_key = "GET /"
  target = "integrations/${aws_apigatewayv2_integration.api_integration.id}"
}



resource "aws_apigatewayv2_stage" "api" {

  api_id = aws_apigatewayv2_api.api.id
  name = "$default"

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.apigatewayv2.arn
    format = "$context.identity.sourceIp - - [$context.requestTime] $context.httpMethod $context.path $context.protocol $context.status $context.responseLength $context.requestId"
  }

  auto_deploy = true

}