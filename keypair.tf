resource "aws_key_pair" "pairs_key" {
  key_name   = "first-terra-key"  # Name of the key pair in AWS
  public_key = file("first-terra-key.pem.pub") 
}
