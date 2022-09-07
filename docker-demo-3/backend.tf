terraform {
  backend "s3" {
    bucket = "terraform-tfstate-eddie"
    key    = "terraform.tfstate-1"
    region = "eu-west-2"
  }
}

