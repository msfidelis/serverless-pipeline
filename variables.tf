################################
###### QUICK EDIT'S HERE  ######
################################

###### CLUSTER OPTIONS  ######

# Customize the Serverless App Name
variable "app_name" {
  description = "Serverless Project Name"
  default     = "serverless-project-demo"
}

###### GITHUB OPTIONS  ######

# Github Repository Owner
variable "git_repository_owner" {
  description = "Github Repository Owner"
  default     = "msfidelis"
}

# Github Repository Project Name
variable "git_repository_name" {
  description = "Project name on Github"
  default     = "serverless-architecture-boilerplate"
}

# Default Branch
variable "git_repository_branch" {
  description = "Github Project Branch"
  default     = "master"
}

# Customize your AWS Region
variable "aws_region" {
  description = "AWS Region for the VPC"
  default     = "us-east-1"
}