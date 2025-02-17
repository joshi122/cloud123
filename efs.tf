resource "aws_efs_file_system" "terr_efs" {
  creation_token = "my-product"

lifecycle {
    ignore_changes = [creation_token]
  }

  encrypted = true
  tags = {
    Name = "efs-terr"
  }
}
