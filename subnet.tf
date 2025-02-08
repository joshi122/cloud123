resource "aws_subnet" "terr_subnet" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "10.0.0.0/25"

  tags = {
    Name = "terr-subnet"
  }
}
