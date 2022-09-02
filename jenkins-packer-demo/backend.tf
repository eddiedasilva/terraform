#terraform {
#  backend "s3" {
#    bucket = "terraform-state-xx70dpnh"
#    key    = "terraform.tfstate"
#    region = "eu-west-1"
#  }
#}
terraform {
  backend "s3" {
    bucket = "terraform-tfstate-eddie"
    key    = "eu-west-2"
    #region         = "${var.AWS_REGION}"
    region = "eu-west-2"
  }
}

