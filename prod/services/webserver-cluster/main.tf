terraform {
  backend "s3" {
    bucket = "terraform-dmsu0215"
    key = "prod/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-dmsu0215-locks"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-prod"
  db_remote_state_bucket = "terraform-dmsu0215"
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "m4.large"
  min_size = 2
  max_size = 10

  enable_autoscaling = true
}