provider "aws" {
  region = "us-east-2"
  #  version = "~> 3.0.0"
}

#terraform {
#  backend "s3" {
#    bucket  = "lab-terraform-leonanxablau"
#    key     = "state-lab/terraform-lab-xablau.tfstate"
#    region  = "us-east-2"
#    encrypt = true
#    #dynamodb_table = "terraform-state-lock-dynamo"
#  
#}

