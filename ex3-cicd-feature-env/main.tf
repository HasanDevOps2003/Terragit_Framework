resource "aws_s3_bucket" "TestBucket" {
  bucket = replace("${var.branch}-my-tf-test-bucket-uyhgyhgjhghuygugjhfgjhf2", "_", "-")
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = var.branch
  }
  lifecycle_rule {
    prefix  = "config/"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }

  versioning {
    enabled = true
  }

}
