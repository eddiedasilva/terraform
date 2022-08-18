#variable "AWS_ACCESS_KEY" {}
#variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
	default		= "eu-west-2"
	}
variable "AMIS" {
	type 	"map"
	default 	= { 
		eu-west-1 = "ami-0e34bbddc66def5ac"
		eu-west-2 = "ami-0e34bbddc66def5ac"
		eu-west-3 = "ami-02d0b1ffa5f16402d"
	}
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

