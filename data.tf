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

data "aws_iam_instance_profile" "instance_profile"{
  name = "TrainingS3InstanceProfile"
}

data "aws_iam_instance_profile" "instance_profile_cloudwatch" {
  name = "TrainingRoleCloudWatch"
}
data "aws_ami""exercise1"{
  filter {
    name   = "name"
    values = ["eshop-celfocus-cloudwatch"]
  }
  owners = ["425239951089"]
}

data "aws_db_snapshot""db_snapshot"{
  db_snapshot_identifier = "eshop-base-copy"
}