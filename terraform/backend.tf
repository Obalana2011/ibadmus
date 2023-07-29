terraform {
  backend "s3" {
    bucket = "ibadmus-resume-state-bucket"
   /*  key    = "your-terraform-state-key" */
    region = "us-east-1"  # Replace with your preferred region
  }
}
