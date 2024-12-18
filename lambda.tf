resource "aws_lambda_function" "ec2_stop_start" {
  function_name = "StopStartEC2Instances"
  filename      = "StopStartEC2Instances.zip"
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.9"

  role = aws_iam_role.lambda_role.arn
}