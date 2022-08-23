terraform {
  backend "s3" {
    bucket = "terraform-tfstate-eddie"
    key    = "eu-west-2"
    #region         = "${var.AWS_REGION}"
    region = "eu-west-2"
  }
}

