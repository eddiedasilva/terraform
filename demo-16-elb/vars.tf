#variable "AWS_ACCESS_KEY" {}
#variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  type    = string
  default = "eu-west-2"
}
variable "AMIS" {
  type = map(any)
  default = {
    eu-west-1 = "ami-0e34bbddc66def5ac"
    eu-west-2 = "ami-0e34bbddc66def5ac"
    eu-west-3 = "ami-02d0b1ffa5f16402d"
  }
}


variable "PRIVATE_KEY" {
  #default = "eddie"
  default = "/root/.ssh/id_rsa"
}

variable "PUBLIC_KEY" {
  #default = "eddie.pem"
  default = "/root/.ssh/id_rsa.pub"
}

variable "USERNAME" {
  default = "ec2-user"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "DOMAIN_NAME" {
	default = "kc-cloud.com"
}





#variable "myvar" {
#	type = string
#  	default = "Hello Eddie"
#}
#variable "mymap" {
#        type = map(string)
#        default = {
#		mykey = "value key Eddie"
#	}
#}
#variable "mylist" {
#        type = list
#       default = [1,2,3]
#}

