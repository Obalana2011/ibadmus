terraform {
  backend "s3" {
    bucket = "ibadmus-resume-state-bucket"
    key    = "resume/terraform.tfstate"
    region = "us-east-1"  # Replace with your preferred region
  }
}





