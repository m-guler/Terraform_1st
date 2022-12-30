provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "ops_vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "Ops VPC"
  }
}
resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Dev VPC"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.ops_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public-Subnet"
  }
}
resource "aws_instance" "web_server" {
  ami           = ami-0b5eea76982371e91
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }
}
