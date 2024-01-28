provider "aws" {
  region = "us-east-1"  # region hardcoded
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "kingsley-bucket-test01" 
  acl    = "private"  # Access control list, options: private, public-read, public-read-write, authenticated-read
  tags = {
    Name        = "MyBucket"
    Environment = "Production"
  }

}

