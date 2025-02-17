terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
resource "aws_iam_user" "lk" {
  name = "india"
  path = "/"
}

resource "aws_iam_group" "kar_group" {
  name = "karnataka"
}

variable "user_names"{
default = [
"kar1",
"kar2",
"kar3",
]
}

resource "aws_iam_user" "users" {
for_each = toset (var.user_names)   #loop through the list of user names
name =each.key    #use each name for the iam user
}

variable "group_name" {
  default = "karnataka"
}


resource "aws_iam_group_membership" "group_membership" {
  name  = "karnataka-membership"
  group = var.group_name

  users = [for user in aws_iam_user.users : user.name]
}

resource "aws_s3_bucket" "example" {
 count  = 10  # Create 10 S3 buckets
  bucket = "up00-${count.index}"
}

resource "aws_vpc" "terra-vpc01" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terra-vpc"
  }
}

resource "aws_instance" "examplefirst" {
  ami           = "ami-0604f27d956d83a4d" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  key_name      = "sanju"

subnet_id     = "subnet-06b6301c5c7193f09"

  tags = {
    Name = "Terfrm-instance"
  }
}

