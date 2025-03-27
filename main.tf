provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = "terraform/statefile.tfstate"
    region         = var.region
    encrypt        = true
  }
}

resource "aws_s3_object" "hello_world_file" {
  bucket       = var.bucket_name
  key          = var.file_key
  source       = "./hello_world.html"
  content_type = "text/html"
  acl          = "public-read"
}

output "hello_world_url" {
  value       = "https://${var.bucket_name}.s3.amazonaws.com/${var.file_key}"
  description = "Public URL of the Hello World application"
}
