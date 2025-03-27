provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "cloud-challenge123" 
    key            = "terraform/statefile.tfstate"
    region         = "us-west-1"        
    encrypt        = true
  }
}

resource "aws_s3_bucket_policy" "hello_world_policy" {
  bucket = var.bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Principal = "*"
        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::${var.bucket_name}/${var.file_key}"
      }
    ]
  })
}


resource "aws_s3_object" "hello_world_file" {
  bucket       = var.bucket_name
  key          = var.file_key
  source       = "./hello_world.html"
  content_type = "text/html"
}

output "hello_world_url" {
  value       = "https://${var.bucket_name}.s3.amazonaws.com/${var.file_key}"
  description = "Public URL of the Hello World application"
}
