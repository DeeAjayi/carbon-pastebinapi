terraform {
  required_version = ">=0.13"
  backend "s3" {
    bucket = "tf-backend-312"
    key    = "pastebin"
    encrypt = true
    dynamodb_table = "tf-backend-lock-table"
    region = "us-east-1"
    profile = "dipo"
  }
}