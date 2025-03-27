variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "cloud-challenge123"
}

variable "file_key" {
  description = "The key (name) of the file to be uploaded to the S3 bucket"
  type        = string
  default     = "hello_world.html" 
}