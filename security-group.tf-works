#data "aws_ip_ranges" "Access" {
#	regions 			= ["eu-west-1","eu-west-2"]
#	services 			= ["ec2"]
#}
#
#
#resource "aws_security_group" "SG-test" {
#	name 		= "SG-test"
#	#services 	= ["ec2"]
#	
#	ingress {
#		from_port 		= "22"
#		to_port			= "22"
##		protocol 		= "tcp"
#	}
#}
#
#
#resource "aws_security_group_rule" "SG-test" {
#  type              = "ingress"
#  from_port         = 22
#  #to_port           = 65535
#  to_port           = 22
#  protocol          = "tcp"
#  #cidr_blocks       = [aws_vpc.SG-test.cidr_block]
#  #ipv6_cidr_blocks  = [aws_vpc.SG-test.ipv6_cidr_block]
# security_group_id = "sg-072f09c805639d3f5"
#}
############################### creates but no connection
resource "aws_security_group" "permit-ssh-https" {
  #pvc_id = "${aws_vpc_id.main.id}"
  name = "permit-ssh-https"
  description = "Allow HTTP and SSH traffic via Terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 22
    to_port     = 22
    #protocol    = "-1"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

