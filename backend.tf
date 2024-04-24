
terraform {
   backend "s3" {
     bucket         = "terraform-state-web-simple"
     key            = "services/web-simple"
     region         = "us-east-2"
     dynamodb_table = "terraform-lock-table"
     encrypt        = true
   }
}
