data "aws_availability_zones" "available" {}

data "template_file" "init" {
  template = file("${path.module}/templates/userdata.sh.tpl")
}

data "template_file" "init_encrypted" {
  template = file("${path.module}/templates/userdata_encrypted.sh.tpl")
}