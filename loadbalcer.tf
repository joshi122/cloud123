resource "aws_lb_target_group_attachment" "atta-err_instances" {
  count            = 3  # Change based on the number of instances
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.my_ec2[count.index].id
  port             = 80
}