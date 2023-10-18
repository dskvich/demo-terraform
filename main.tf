provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0430580de6244e02e"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}