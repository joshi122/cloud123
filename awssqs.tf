resource "aws_sqs_queue" "example" {
  name = "sqs-darshan"
}

resource "aws_sns_topic_subscription" "example_sqs" {
  topic_arn = aws_sns_topic.example.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.example.arn
}

resource "aws_sns_topic" "example" {
  name = "sns-darshan"
}

# VPC
resource "aws_vpc" "terra-01" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-vpc"
  }
}

# Subnet
resource "aws_subnet" "example" {
  vpc_id                  = aws_vpc.terraform.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name = "terraform-internet-gateway"
  }
}

# Route Table
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }

  tags = {
    Name = "terraform-route-table"
  }
}

# Associate Subnet with Route Table
resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.example.id
  route_table_id = aws_route_table.example.id
}

# Security Group
resource "aws_security_group" "example" {
  vpc_id      = aws_vpc.terraform.id
  name        = "ec2-security-group"
  description = "Allow inbound SSH and HTTP access"
}
resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-0604f27d956d83a4d" # Replace with a valid AMI for your region
  instance_type = "t2.micro"

  subnet_id          = aws_subnet.example.id
  key_name           = "sanju" # Make sure this key pair exists in AWS

  tags = {
    Name        = "ec2instances-terraform-${count.index + 1}"
    Description = "Instance created by Terraform"
  }
}
