provider "aws"{
region = "ap-south-1"
profile = "ShellPowerUser"
}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Red VPC"
  }
}

output "vpcid" {
  value = aws_default_vpc.default.id
}

#
# resource "aws_security_group" "Master SG" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = "${aws_vpc.main.id}"
#   ingress {
#     # TLS (change to whatever ports you need)
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     # Please restrict your ingress to only necessary IPs and ports.
#     # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
#     cidr_blocks = # add a CIDR block here
#   }
#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#     prefix_list_ids = ["pl-12c4e678"]
#   }
# }