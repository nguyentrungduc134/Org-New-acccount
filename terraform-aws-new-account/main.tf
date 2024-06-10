# main.tf

provider "aws" {
  alias  = "main"
  region = var.region
}

provider "aws" {
  alias  = "new_account"
  region = var.region
}

resource "aws_organizations_account" "new_account" {
  provider = aws.main
  name      = var.account_name
  email     = var.account_email
  role_name = "OrganizationAccountAccessRole"
}

resource "aws_iam_role" "admin_role" {
  provider = aws.main
  name     = "AdminRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${aws_organizations_account.new_account.id}:root"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "admin_role_attach" {
  provider = aws.main
  role       = aws_iam_role.admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role" "switch_role" {
  provider = aws.new_account
  name     = "SwitchRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${aws_organizations_account.new_account.id}:role/OrganizationAccountAccessRole"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_instance" "new_instance" {
  provider      = aws.new_account
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "NewInstance"
  }
}

