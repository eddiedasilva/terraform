#resource "aws_instance" "vm-test" {

#       #ami                    = "ami-0e34bbddc66def5ac"
#       #ami                    = "var.lookup(var.AWS_REGION)"
#       ami                     = "${lookup(var.AMIS, var.AWS_REGION)}"
#       #ami                    = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
#       instance_type           = "t2.micro"
#       key_name                = "eddie"
###########################################################
#resource "aws_key_pair" "eddie" {
#  key_name = "eddie"
#  #public_key 			= file("/root/.ssh/id_rsa.pub")
#  public_key = file("${var.PUBLIC_KEY}")
#}



resource "aws_instance" "VM3" {
  ami           			= var.AMIS[var.AWS_REGION]
  instance_type 			= "t2.micro"
  #key_name      			= "eddie"
  key_name = aws_key_pair.eddie.key_name # in provider's file
  # increase root file system size, default is 8GB
  #root_block_device {
  #  volume_size					= 16
  #  volume_type					= "gp2"
  #  delete_on_termination			= true
  #}
  vpc_security_group_ids = ["${aws_security_group.permit-ssh-https.id}"]
  
  # install openVPN with userdata
 #user_data					= "sudo amazon-linux-extra install epel\nsudo yum install openvpn"
 #user_data					= "${data.template_cloudinit_config.cloudinit-example.rendered}"
 user_data 					= data.cloudinit_config.cloudinit-example.rendered

  provisioner "file" {
    source      			= "scripts/ngnix.sh"
    destination = 			"/tmp/ngnix.sh"
  }
 connection {
    host 				= coalesce(self.public_ip, self.private_ip)
    type 				= "ssh"
    #user                               = "ec2-user"
    #private_key                        = file("/root/.ssh/id_rsa")
    user        			= var.USERNAME
    private_key 			= file("${var.PRIVATE_KEY}")
  }

  provisioner "remote-exec" {
    inline 				= [
      "chmod +x /tmp/ngnix.sh",
      #"sudo sed -i -e 's/\r$//' /tmp/ngnix.sh",  # Remove the spurious CR characters.
      "sudo /tmp/ngnix.sh"
    ]
  }
  #connection {
  #  host = coalesce(self.public_ip, self.private_ip)
  #  type = "ssh"
  #  #user        			= "ec2-user"
  #  #private_key 			= file("/root/.ssh/id_rsa")
  #  user        = var.USERNAME
  #  private_key = file("${var.PRIVATE_KEY}")
  #}
  provisioner "local-exec" {
    command 				= "echo ${aws_instance.VM3.private_ip}	>> private_ips.txt"
  }
}
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone 			= "eu-west-2b" 
  size					= 20
  type					= "gp2" # General Purpose storage, can also be standard or io 1 or st1
  #tags {
  #  Name					=  "extra volume data"
  #}
}
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  #device_name 				= "/dev/xvdh"
  device_name 				= "${var.INSTANCE_DEVICE_NAME}"
  volume_id 				= "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id				= "${aws_instance.VM3.id}"
}

output "ip" {
  value = aws_instance.VM3.public_ip

}

