variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "JENKINS_VERSION" {
  default = "2.366"
}

variable "TERRAFORM_VERSION" {
  default = "0.12.23"
}

variable "APP_INSTANCE_COUNT" {
  default = "0"
}

variable "DUMMY_SSH_PUB_KEY" {
  description = "public ssh key to put in place if there's no public key defined - to avoid errors in jenkins if it doesn't have a public key"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYvRFukIhbayAVAlbGsZFkvKJym+LMnz5DAkub9U1amzxD/gbx3ATAOV7NWLQ27BZFHnGrr2oKzFRGnvvJQxirqiOPoHtGHgLrYpRFonZHOrK5OlJdzfx0Hsx3H2Gyz9nn/WBI1ctc01jZHnpfWoJFTEIRAJsNkHsTmE3WJkdJTbKTDxqzVZjWEJl2QSGAC4VxC6Vuu/bAn5RGbOk3I7Ctf4alXHyp54LC/siyHWx3cXpYFfQBWhcvXeTbErS5smXpzLuhesX66wSryzOuWLvs3ro5/6vKKAXjsBN7ZjP7J+DiveiDBHPFCSi/9tft/KifTSMcy2s1Tn+lHaj6SFjiRMhBpJL0co0onmUeLcNfv7Xr5V6lQ3Y96gRgjLDkoTwBQVXszq5I81NO1O67ymRQZvh8ENY+dlPlF7dRj8DLac5Y2I23bKFY2X/GSFYPC3XvDeEw0Y40nwGJmOqr6ZXzSH5n0bhQmsOBCjfQX2+fHIdAN5SomI+nIAkJae4QegE= esilva@gammatelecom.com@esilva.vdi.intra.gammatelecom.com"
}
