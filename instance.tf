resource "aws_instance" "vm-test" {
  #ami           	= "ami-0e34bbddc66def5ac"
  ami           	= "${var.looup(var.AWS_REGION)}"
  instance_type         = "t2.micro"
  key_name		= "eddie"
}
  
#resource "aws_security_group" "test-terrafor" {
#  #name = "${random_pet.name.id}-sg"
#  name = "test-security"
#  ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}
