# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "my_bucket_ownership" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_ownership_public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.my_bucket_ownership,
    aws_s3_bucket_public_access_block.my_bucket_ownership_public_access,
  ]

  bucket = aws_s3_bucket.my_bucket.id
   acl    = "public-read"
 
}

# Upload index.html
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.my_bucket.id
  key          = "index.html"
  source       = "index.html"

  content_type = "text/html"
}

# Upload error.html
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.my_bucket.id
  key          = "error.html"
  source       = "error.html"

  content_type = "text/html"
}

# Upload a single CSS file
resource "aws_s3_object" "portfolio_css" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "Portfolio/style.css"
  source = "./Portfolio/style.css"

  content_type = "text/css"
}

# Upload a single image file
resource "aws_s3_object" "portfolio_image" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "Portfolio/Linkedin Pic.JPG"
  source = "./Portfolio/Linkedin Pic.JPG"

  content_type = "image/jpeg"
}


# Website configuration for the bucket
resource "aws_s3_bucket_website_configuration" "aws_s3_object_config" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.my_bucket.id

  depends_on = [
    aws_s3_bucket_public_access_block.my_bucket_ownership_public_access
  ]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}
