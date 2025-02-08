provider "aws" {
  region = "us-east-2"  # Change to your preferred AWS region
}

resource "aws_instance" "my_ec2" {
  count         = 3
  ami           = "ami-088b41ffb0933423f" # Update with the latest Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  key_name     =  aws_key_pair.pairs_key.key_name # Update with the name of your key pair
  subnet_id     = aws_subnet.terr_subnet.id
  security_groups = [aws_security_group.sg_terr.id]

  #user_data = lookup(var.user_data_scripts, count.index, "#!/bin/bash\necho 'No script assigned'")
   user_data = lookup(var.user_data_scripts, tostring(count.index), "#!/bin/bash\necho 'No script assigned'")

  associate_public_ip_address = true
  tags = {
    Name = "Terraform-EC2-${count.index + 1}"
  }

depends_on = [aws_key_pair.pairs_key]  # ✅ Ensure key pair is created first
}
