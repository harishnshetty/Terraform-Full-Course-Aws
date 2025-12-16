output "bucket_names" {
    value = aws_s3_bucket.bucket1[*].id

}

output "bucket3" {
    value = aws_s3_bucket.bucket3.id
  
}