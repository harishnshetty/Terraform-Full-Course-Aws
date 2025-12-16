resource "aws_s3_bucket" "bucket1" {
  count = 2
  bucket = var.bucket_names[count.index]
  tags = var.tags

  region = tolist(var.allowed_region)[0]

}


resource "aws_s3_bucket" "bucket2" {
  for_each = var.bucket_names_set
  bucket = each.value

  tags = var.tags
    region = tolist(var.allowed_region)[0]

    depends_on = [ aws_s3_bucket.bucket1 ]
}