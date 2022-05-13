data "aws_availability_zones" "available" {}

data "template_file" "init" {
  template = file("${path.module}/userdata.sh.tpl")
}

