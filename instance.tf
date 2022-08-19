#resource "aws_instance" "vm-test" {

#       #ami                    = "ami-0e34bbddc66def5ac"
#       #ami                    = "var.lookup(var.AWS_REGION)"
#       ami                     = "${lookup(var.AMIS, var.AWS_REGION)}"
#       #ami                    = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
#       instance_type           = "t2.micro"
#       key_name                = "eddie"
###########################################################
#resource "aws_key_pair" "eddie" {
#  key_name   = "eddie"
#  #public_key = file(var./root/.ssh/id_rsa.pub)
#  public_key = file("/root/.ssh/id_rsa.pub")
#}

resource "aws_instance" "example1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  #key_name      = aws_key_pair.eddie.key_name
  key_name      = eddie

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = "ec2-user"
    #private_key = file(var.var./root/.ssh/id_rsa.pub)
    #private_key = file("/root/.ssh/id_rsa.pub")
    private_key = file("/root/.ssh/id_rsa")
  }
}

