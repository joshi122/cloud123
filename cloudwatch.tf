resource "aws_cloudwatch_metric_alarm" "terr-cw-test" {
  alarm_name                = "terra-cloudwatch-alaram"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 3
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 10
  statistic                 = "Average"
  threshold                 = 10
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
}