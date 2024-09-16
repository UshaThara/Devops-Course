resource "aws_s3_bucket" "terraform_backend" {
  bucket = "devOps_sept2024_terraform_backend_ec2"

  tags = {
  Name        = "Terraform state file"
    Environment = "Dev"  
  }
}

resource "aws_s3_bucket_versioning" "versioning_terraform_backend" {
  bucket = aws_s3_bucket.terraform_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "s3_bucket_id" {
  value = aws_s3_bucket.terraform_backend.id
}