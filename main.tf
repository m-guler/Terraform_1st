provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_first_server" {
  ami           = ami-0b5eea76982371e91
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}