terraform {
  backend "s3" {
    bucket         = "smartpay-bucket-ka"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
