resource "aws_iam_user" "user_terr" {
  name = "user-terr-01"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_group" "terra_group" {
  name = "first-terra-gp"
  path = "/users/"
}

resource "aws_iam_group_membership" "add_user_to_group" {
  name  = "first-terra-gp-membership"
  group = aws_iam_group.terra_group.name  # ✅ Corrected Reference

  users = [
    aws_iam_user.user_terr.name  # ✅ Corrected Reference
  ]
}
