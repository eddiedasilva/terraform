provider "aws" {
	#access_key		"${var.AWS_ACCESS_KEY}"
	#secret_key		"${var.AWS_SECRET_KEY}"
	#region     		= "${var.AWS_REGION}"
	region     		= "eu-west-2"
}
#terraform {
#	backend "s3" {
#		bucket		= "terraform-tfstate-eddie"
#		#key		= "key_path"
#		#region     	= "${var.AWS_REGION}"
#		region		= "eu-west-2"
#	}
#}
