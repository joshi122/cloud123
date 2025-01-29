provider "aws" {
  region = "us-east-2"
}

resource "aws_sns_topic" "darshan" {
  name = "darshan01"
}

resource "aws_sns_topic_subscription" "example_email" {
  topic_arn = aws_sns_topic.darshan.arn
  protocol  = "email"
  endpoint  = "joshisudarshan068@gmail.com"
}


