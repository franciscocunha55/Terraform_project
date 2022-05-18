resource "aws_ecr_repository" "ecr_repo_base" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability

#  tags = {
#    Name = var.tags.Name
#  }

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  encryption_configuration {
    encryption_type = var.encryption_type
    #kms_key = data.aws_kms_key.by_key_arn.key_id
  }

#  encryption_configuration {
#    encryption_type = var.encryption_type
#    kms_key = aws_kms_key.kms_key.key_id
#  }
#
}
#
#resource "aws_kms_key" "kms_key" {
#  description             = "KMS key"
#  deletion_window_in_days = 10
#}