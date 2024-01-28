provider "aws" {
  region = "us-east-1"  # region hardcoded
}


terraform {
  backend "s3" {
    bucket         = "terraform-state-kingsley"
    key            = "devops-exercise/terraform.tfstate"
    region         = "us-east-1"
  }
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "kingsley-bucket-test001" 
  acl    = "private"  # Access control list, options: private, public-read, public-read-write, authenticated-read
  tags = {
    Name        = "MyBucket"
    Environment = "Production"
  }

}

