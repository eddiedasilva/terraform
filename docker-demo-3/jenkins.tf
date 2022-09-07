resource "aws_instance" "jenkins-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.small"

  # the VPC subnet
  subnet_id = "subnet-0d5cc2e1565e00163"

  # the security group
  vpc_security_group_ids = [aws_security_group.jenkins-securitygroup.id]

  # the public SSH key
  key_name = "mykey"

  # user data
  user_data = data.cloudinit_config.cloudinit-jenkins.rendered
}

resource "aws_ebs_volume" "jenkins-data" {
  availability_zone = "eu-west-2a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "jenkins-data"
  }
}

resource "aws_volume_attachment" "jenkins-data-attachment" {
  device_name = var.INSTANCE_DEVICE_NAME
  volume_id   = aws_ebs_volume.jenkins-data.id
  instance_id = aws_instance.jenkins-instance.id
}

