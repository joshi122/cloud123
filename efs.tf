resource "aws_efs_file_system" "terr_efs" {
  creation_token = "my-product"

  encrypted = true
  tags = {
    Name = "efs-terr"
  }
}
