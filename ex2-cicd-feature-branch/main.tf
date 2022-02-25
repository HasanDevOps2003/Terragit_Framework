resource "aws_s3_bucket" "TestBucket" {
  bucket = "my-tf-test-bucket-uyhgyhgjhghuygu"
  acl    = "private"

  # Add Server Side Encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Create a KMS key for the S3 bucket
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}