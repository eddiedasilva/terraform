provider "cloudinit" {}

data "template_file" "init-script" {
  template 			= "${file("scripts/volume.sh")}" 			
}
