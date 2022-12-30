provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_instance" "my_first_server" {
  ami           = ami-0b5eea76982371e91
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
