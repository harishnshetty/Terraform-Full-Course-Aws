resource "aws_s3_bucket" "bucket1" {
  bucket = "my-tf-demo-harish-bucket-2026"

  tags = {
    Name = "my-tf-demo-harish-bucket-2026"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket1.bucket

  versioning_configuration {
    status = "Enabled"
  }

}

