provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Project     = "platform-infra"
      Environment = "bootstrap"
      ManagedBy   = "Terraform"
    }
  }
}