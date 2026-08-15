terraform {
  backend "s3" {
    bucket         = "platform-infra-terraform-state-jp-bucket-806100285736"
    key            = "platform-infra/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "platform-infra-terraform-lock"
    encrypt        = true
  }
}