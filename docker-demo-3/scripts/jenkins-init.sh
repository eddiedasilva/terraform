#!/bin/bash

# volume setup
vgchange -ay

DEVICE_FS=`blkid -o value -s TYPE ${DEVICE}`
if [ "`echo -n $DEVICE_FS`" == "" ] ; then 
  # wait for the device to be attached
  DEVICENAME=`echo "${DEVICE}" | awk -F '/' '{print $3}'`
  DEVICEEXISTS=''
  while [[ -z $DEVICEEXISTS ]]; do
    echo "checking $DEVICENAME"
    DEVICEEXISTS=`lsblk |grep "$DEVICENAME" |wc -l`
    if [[ $DEVICEEXISTS != "1" ]]; then
      sleep 15
    fi
  done
  pvcreate ${DEVICE}
  vgcreate data ${DEVICE}
  lvcreate --name volume1 -l 100%FREE data
  mkfs.ext4 /dev/data/volume1
fi
mkdir -p /var/lib/jenkins
echo '/dev/data/volume1 /var/lib/jenkins ext4 defaults 0 0' >> /etc/fstab
mount /var/lib/jenkins

# install default-jre (needed for ubuntu 18.04)
#apt-get update
sudo amazon-linux-extras install java-openjdk11 -y
java -version

# install jenkins and docker
#curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
#   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
# https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
# /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo yum install wget -y
sudo yum update -y
sudo yum install -y docker
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo yum upgrade
sudo yum install jenkins -y
sudo systemctl enable jenkins

# enable docker and add perms
usermod -G docker jenkins
systemctl enable docker
service docker start
service jenkins restart

# install pip
wget -q https://bootstrap.pypa.io/get-pip.py
python get-pip.py
python3 get-pip.py
rm -f get-pip.py
# install awscli
pip install awscli

# install terraform
TERRAFORM_VERSION="0.12.18"
wget -q https://releases.hashicorp.com/terraform/$${TERRAFORM_VERSION}/terraform_$${TERRAFORM_VERSION}_linux_amd64.zip \
&& unzip -o terraform_$${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_$${TERRAFORM_VERSION}_linux_amd64.zip

# clean up
sudo yum clean
#rm terraform_0.12.18_linux_amd64.zip
