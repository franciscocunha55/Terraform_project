data "aws_availability_zones" "available" {}

data "template_file" "init" {
  template = file("${path.module}/templates/userdata.sh.tpl")
}

data "template_file" "init_encrypted" {
  template = file("${path.module}/templates/userdata_encrypted.sh.tpl")
}

data "aws_kms_key" "by_key_arn" {
  key_id = "arn:aws:kms:eu-west-2:425239951089:key/d3e3479d-38d7-4c7e-9e11-c9f70a80dd38"
}