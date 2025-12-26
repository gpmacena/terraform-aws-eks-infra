terraform {
  backend "s3" {
    bucket         = "projeto2-terraform-bucket"
    key            = "dev/terraform.tfstate"
    region         = "sa-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock-table"
  }
}