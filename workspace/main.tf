provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0430580de6244e02e"
  instance_type = "t2.micro"
}

terraform {
  backend "s3" {
    bucket = "terraform-dmsu0215"
    key = "workspace-example/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-dmsu0215-locks"
    encrypt = true
  }
}
