variable "user_data_scripts" {
  type = map(string)
  default = {
    "0" = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Namaste! This is my first Terraform user data</h1>" > /var/www/html/index.html
    EOF

    "1" = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Namaste! This is my second Terraform user data</h1>" > /var/www/html/index.html
    EOF

    "2" = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Namaste! This is my third Terraform user data</h1>" > /var/www/html/index.html
    EOF
  }
}
