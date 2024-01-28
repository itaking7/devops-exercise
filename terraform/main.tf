provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Replace with your desired bucket name
  acl    = "private"  # Access control list, options: private, public-read, public-read-write, authenticated-read
  tags = {
    Name        = "MyBucket"
    Environment = "Production"
  }

  # Uncomment the following if you want to enable versioning
  # versioning {
  #   enabled = true
  # }
  
  # Uncomment the following if you want to enable server-side encryption
  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       sse_algorithm = "AES256"
  #     }
  #   }
  # }
}

