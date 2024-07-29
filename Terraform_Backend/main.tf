resource "aws_vpc" "main" {
  cidr_block = var.Vpc_cidr_block

  tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "New_Subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "us-east-1c"

  tags = {
    Name = "main_subnet"
  }
}


resource "aws_security_group" "instance_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All protocols
    cidr_blocks = [var.cidr_blocks]
  }

  tags = {
    Name = "instance_sg"
  }
}


resource "aws_instance" "new_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.New_Subnet.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  tags = {
    Name = "ExampleInstance"
  }
}

