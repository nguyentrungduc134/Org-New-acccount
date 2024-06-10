# Terraform Module: AWS Sub-Account Setup

This Terraform module creates a new AWS sub-account, sets up an administrative role to access the new account, and launches a new instance in the default VPC and zone.

1. Creates a new AWS sub-account.
2. Sets up an administrative role in the new account.
3. Creates a new EC2 instance (t2.micro) in the default VPC and default availability zone of the new account.

## Prerequisites

- Terraform installed on your local machine.
- AWS CLI configured with necessary permissions.
- AWS Organization must be enabled in your AWS account.


## Usage

```hcl
module "aws_subaccount_setup" {
  source      = "./terraform-aws-new-account"
  account_name   = "NewSubAccount"
  account_email  = "new_account@example.com"
  ami_id         = "ami-0a2781a262879e465"
  main_provider = {
    region = "us-west-1"
    # Add any other provider configurations here if needed
  }
  new_account_provider = {
    region = "us-west-1"
    # Add any other provider configurations here if needed
  }
}


