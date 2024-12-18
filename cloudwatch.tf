resource "aws_cloudwatch_event_rule" "stop_ec2_instances" {
  name        = "stop_ec2_instances"
  description = "Stops running EC2 instances at 18:00"

  schedule_expression = "cron(0 18 * * ? *)" # Runs every day at 18:00]
}

resource "aws_cloudwatch_event_target" "stop_ec2_instances_target" {
  rule = aws_cloudwatch_event_rule.stop_ec2_instances.name
  target_id = "stop_ec2_instances"
  arn  = aws_lambda_function.ec2_stop_start.arn
}

resource "aws_cloudwatch_event_rule" "start_ec2_instances" {
  name        = "start_ec2_instances"
  description = "Starts stopped EC2 instances at 08:00"

  schedule_expression = "cron(0 8 * * ? *)" # Runs every day at 08:00
}

resource "aws_cloudwatch_event_target" "start_ec2_instances_target" {
  rule = aws_cloudwatch_event_rule.start_ec2_instances.name
  target_id = "start_ec2_instances"
  arn  = aws_lambda_function.ec2_stop_start.arn
}