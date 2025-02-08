resource "aws_ebs_volume" "ebs_terr" {
  availability_zone = "us-east-2a"
  size              = 3
  count             = 3

  tags = {
    Name = "ebs-terr-vol-${count.index + 1}"
  }
}

resource "aws_volume_attachment" "ebsatt_terr" {
  count       = 3
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_terr[count.index].id
  instance_id = aws_instance.my_ec2[count.index].id
}