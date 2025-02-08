output "instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = aws_instance.my_ec2[*].public_ip
}
output "instance_private_ips" {
  description = "Private IP addresses of EC2 instances"
  value       = aws_instance.my_ec2[*].private_ip
}