resource "aws_vpc" "terraform" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "first-tf-vpc"
  }

  lifecycle {
    ignore_changes = [cidr_block]  # Add more attributes here if necessary
  }
}
