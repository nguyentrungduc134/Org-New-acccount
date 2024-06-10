module "aws_subaccount_setup" {
  source      = "./terraform-aws-new-account"
  account_name   = "NewSubAccount"
  account_email  = "new_account@example.com"
  ami_id         = "ami-0a2781a262879e465"
  main_provider = {
    region = "us-west-1"
  }
  new_account_provider = {
    region = "us-west-1"
    # Add any other provider configurations here if needed
  }
}


