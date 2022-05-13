


terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "celfocus-student-3"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-up-and-running-locks"

  }
}

provider "aws" {
  # Configuration options
  profile = "default"

  region = "eu-west-2"

}