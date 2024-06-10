# variables.tf

variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-west-1"
}

variable "account_name" {
  description = "The name of the new AWS account."
  type        = string
}

variable "account_email" {
  description = "The email for the new AWS account."
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the new instance."
  type        = string
}

variable "main_provider" {
  description = "Configuration for the main AWS provider."
  type        = map(any)
}

variable "new_account_provider" {
  description = "Configuration for the new AWS account provider."
  type        = map(any)
}

