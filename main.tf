provider "aws" {
  region = "ap-south-1"
}

###########################################
# DEV ENVIRONMENT
###########################################
module "dev-infra" {
  source          = "./infra-app"
  env             = "dev"
  bucket_name     = "infra-dev-bucket"
  instance_count  = 1
  instance_type   = "t2.micro"
  ec2_ami_id      = "ami-02b8269d5e85954ef"
  hash_key        = "studentID"
  public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
}

###########################################
# STAGING ENVIRONMENT
###########################################
module "stg-infra" {
  source          = "./infra-app"
  env             = "stg"
  bucket_name     = "infra-stg-bucket"
  instance_count  = 1
  instance_type   = "t2.micro"
  ec2_ami_id      = "ami-02b8269d5e85954ef"
  hash_key        = "studentID"
  public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
}

###########################################
# PRODUCTION ENVIRONMENT
###########################################
module "prd-infra" {
  source          = "./infra-app"
  env             = "prd"
  bucket_name     = "infra-prd-bucket"
  instance_count  = 1
  instance_type   = "t2.micro"
  ec2_ami_id      = "ami-02b8269d5e85954ef"
  hash_key        = "studentID"
  public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
}
