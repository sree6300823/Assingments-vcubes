provider "aws" {
 access_key = "AKIAP67ZROBTRX2"
  secret_key = "HvGTcGkCzQ6qVMRp2rIHSozayPKZl6m1yc2jq"
    region = "eu-central-1"
}
# create s3 bucket
resource "aws_s3_bucket" "bucket123" {
  bucket = "my-tf-test-bucket123456789"     # Optional prefix for the bucket name

  tags = {
    Name        = "My bucket1"
  }
}
# create object file upload

resource "aws_s3_bucket_object" "objec12" {
  bucket = "my-tf-test-bucket123456789"
  key    = "main"     # Specify the key (filename) under which to store the file in the bucket
 source = "D:\\dev"   # Path to the local file you want to upload
  
tags = {
    Name        = "MyObject"
  }
}
