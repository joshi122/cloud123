#resource "aws_vpc_security_group_ingress_rule" "sg_ipv6" {
  #security_group_id = aws_security_group.allow_tls.id
 # cidr_ipv6         = aws_vpc.terraform.ipv6_cidr_block
 # from_port         = 80
 # ip_protocol       = "tcp"
 # to_port           = 80
#}

#resource "aws_vpc_security_group_egress_rule" "sg_ipv4" {
  #security_group_id = aws_security_group.allow_tls.id
  #cidr_ipv4         = "0.0.0.0/0"
 # ip_protocol       = "-1" # semantically equivalent to all ports
#}

resource "aws_security_group" "sg_terr" {
  name   = "terr-1-sg"
  vpc_id = aws_vpc.terraform.id

  # Allow SSH (port 22) - Optional
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict to your IP for better security
  }

  # Allow HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to all for web access
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
