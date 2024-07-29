
# Create a VPC
resource "aws_vpc" "My_vpc_Network" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "AWS_SG" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  #vpc_id      = "${aws_vpc.main.id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
    # add a CIDR block here
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}


# EC2 instance resource with security group
resource "aws_instance" "Firstinstance" {
  ami           = "ami-0427090fd1714168b"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.AWS_SG.id]
  tags = {
    Name = "my-ec2-instance"
  }
}
