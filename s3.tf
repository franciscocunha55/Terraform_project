resource "aws_s3_bucket" "celfocus-student-3-new" {
  bucket = "celfocus-student-3-new"
}

resource "aws_s3_bucket_acl" "celfocus-student-3-new-acl" {
  bucket = aws_s3_bucket.celfocus-student-3-new.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_celfocus-student-3-new" {
  bucket = aws_s3_bucket.celfocus-student-3-new.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "celfocus-student-3-new-encryption" {
  bucket = aws_s3_bucket.celfocus-student-3-new.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = data.aws_kms_key.by_key_arn.key_id
      sse_algorithm     = "aws:kms"
    }
  }
}