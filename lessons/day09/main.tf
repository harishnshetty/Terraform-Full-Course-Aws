resource "aws_s3_bucket" "bucket1" {
  count = 2
  bucket = var.bucket_names[count.index]
  tags   = var.tags

  # If you need region-specific settings, configure the provider instead
  # Or use force_destroy, etc. as needed
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  count  = length(aws_s3_bucket.bucket1)
  bucket = aws_s3_bucket.bucket1[count.index].id

  versioning_configuration {
    status = "Enabled"
  }

  lifecycle {
    ignore_changes = [versioning_configuration]
    prevent_destroy = false
  }
}

resource "aws_s3_bucket" "bucket2" {
  for_each = var.bucket_names_set
  bucket = each.value

  tags = var.tags
    region = tolist(var.allowed_region)[0]

    depends_on = [ aws_s3_bucket.bucket1 ]
}

resource "aws_s3_bucket_versioning" "bucket_versioning2" {
  for_each = aws_s3_bucket.bucket2
  bucket = aws_s3_bucket.bucket2[each.key].id

  versioning_configuration {
    status = "Suspended"
  }
# If you want to prevent accidental changes to versioning, use prevent_destroy
  lifecycle {
    prevent_destroy = false  # Prevents versioning from being changed
  }
}

resource "aws_s3_bucket" "bucket3" {
  bucket = "my-unique-bucket-2025-124521-1225sds"
  

  tags = var.tags
    region = tolist(var.allowed_region)[0]

    depends_on = [ aws_s3_bucket.bucket2 ]
  
  lifecycle {
    postcondition {
      condition = contains(keys(var.tags), "Compliance")
      error_message = "Tag 'Compliance' must be present in the tags map."
    }
  }
}