provider "aws" {
  #access_key		"${var.AWS_ACCESS_KEY}"
  #secret_key		"${var.AWS_SECRET_KEY}"
  #region     		= "eu-west-2"
  region     		= "${var.AWS_REGION}"
}

