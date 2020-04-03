resource "aws_s3_bucket" "terraform_state" {
  bucket = "aws-terraform-states-1023"
 
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
#    prevent_destroy = true
  }

  # Enable versioning so we can see the full revision history of our state files
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default 
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
