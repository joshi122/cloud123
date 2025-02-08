resource "aws_route_table" "terr_rt" {
  vpc_id = aws_vpc.terraform.id

  route = []

  tags = {
    Name = "rt-terr-example"
  }
}