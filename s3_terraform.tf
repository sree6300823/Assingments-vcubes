provider "aws" {
 access_key = "AKIAP67ZROBTRX2"
  secret_key = "HvGTcGkCzQ6qVMRp2rIHSozayPKZl6m1yc2jq"
    region = "eu-central-1"
}
# create s3 bucket
resource "aws_s3_bucket" "bucket123" {
  bucket = "my-tf-test-bucket123456789"

  tags = {
    Name        = "My bucket1"
  }
}
# create object file upload

resource "aws_s3_bucket_object" "objec12" {
  bucket = "my-tf-test-bucket123456789"
  key    = "main"
  source = "D:\\dev"
}