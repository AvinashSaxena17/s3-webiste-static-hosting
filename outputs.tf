#Output the website URL :

output "website_url" {

  value = aws_s3_bucket_website_configuration.aws_s3_object_config.website_endpoint

}