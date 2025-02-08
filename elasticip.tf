resource "aws_eip" "eip_terraform" {
  vpc = true
  tags = {
    Name = "Terr-firstEIP"
  }
}
resource "aws_eip" "eip_terr" {
  vpc = true
  instance = aws_instance.my_ec2[0].id  # Attach to first EC2 instance
  tags = {
    Name = "Terr-firstEIP"
  }
}
