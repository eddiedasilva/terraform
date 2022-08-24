data "cloudinit_config" "cloudinit-example" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = templatefile("scripts/init.cfg", {
      REGION = var.AWS_REGION
    })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("scripts/volumes.sh", {
      DEVICE = var.INSTANCE_DEVICE_NAME
    })
  }
}






#data "template_file" "init-script" {
#  template 			= "${file("scripts/init.cfg")}" 			
#  vars {
#    REGION 			= "${var.AWS_REGION}"
#  }
#}


#data "template_file" "shell-script" {
#  template 			= "${file("scripts/volume.sh")}" 			
#  vars {
#    DEVICE 			= "${var.INSTANCE_DEVICE_NAME}"
#  }
#}
#data "template_cloudinit_config" "cloudinit-example" {
#  gzip 				= false
#  base64_encode 		= false
  
#  part {
#    filename 			= "init.cfg"
#    content_type 		= "text/cloud-config"
#    content			= "${data.template_file.shell-script.rendered}"
#  }
#}
