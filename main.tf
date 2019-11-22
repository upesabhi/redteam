provider "aws"{
region = "ap-south-1"
profile = "ShellPowerUser"
}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Red VPC"
  }
}


locals {
  timestamp = "${timestamp()}"
}
output "timestamp" {
  value = local.timestamp
}

resource "aws_security_group" "MasterSG" {
  name        = "redmasterSG-${local.timestamp}"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_default_vpc.default.id}"
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"

    
    
  }
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"

    
    #
  }
}



resource "aws_security_group" "NodeSG" {
  name        = "rednodeSG-${local.timestamp}"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"



    
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    #cidr_blocks = # add a CIDR block here
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"

    
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    #cidr_blocks = # add a CIDR block here
  }
}


# output ID's
output "vpcid" {
  value = aws_default_vpc.default.id
}


output "sgmaster" {
  value = aws_security_group.MasterSG.id
  
}

output "sgnode" {
  
  value = aws_security_group.NodeSG.id
}
  
  


