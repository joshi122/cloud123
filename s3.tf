resource "aws_s3_bucket" "s3_terraform" {
  bucket = "99-terr-s3"  #give the unique name here for the bucket

  tags = {
    Name        = "s3-terra"
    Environment = "Dev"
  }
}