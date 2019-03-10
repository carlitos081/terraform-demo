provider "aws" {
  region = "${var.region}"
}

/*
terraform {
  backend "s3" {
    bucket               = "efx-cloud-cse-nonprod-core-backend"
    workspace_key_prefix = "coll/tfstate/demo/ec2"
    dynamodb_table       = "cse-cnr-terraform-state-file"
    key                  = "coll/demo/ec2/terraform.tfstate"
    region               = "us-east-1"
  }
}*/
