resource "aws_s3_bucket" "TestBucket" {
  bucket = replace("${var.branch}-my-tf-test-bucket-uyhgyhgjhghuygugjhfgjhf2", "_", "-")
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = var.branch
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled = true
  }

}
