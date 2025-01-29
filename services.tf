provider "aws" {
  region = "us-east-2"
  alias  = "east"
}

resource "aws_instance" "terraform" {
  ami           = "ami-0eb070c40e6a142a3" # Replace with a valid AMI for your region
  instance_type = "t2.micro"

  key_name           = "sanju" # Make sure this key pair exists in AWS

  tags = {
    Name        = "terraform"
    Description = "Instance created by Terraform"
  }
}
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-2a" # Replace with your desired AZ
  size              = 10          # Size in GB
  tags = {
    Name = "example-terraform"
  }
}
