####################################
# Global Variables
####################################

variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "account_name" {
  type = string
}

####################################
# Variables IAM Password Policies
####################################

variable "allow_users_to_change_password" {
  type        = bool
}

variable "minimum_password_length" {
  type        = number
}

variable "require_lowercase_characters" {
  type        = bool
}

variable "require_numbers" {
  type        = bool
}

variable "require_symbols" {
  type        = bool
}

variable "require_uppercase_characters" {
  type        = bool
}

variable "max_password_age" {
  type        = number
}

variable "hard_expiry" {
  type        = bool
}

variable "password_reuse_prevention" {
  type        = number
}

####################################
# EventBridge and SNS
####################################


variable "sns_email" {
  type = string
}

####################################
# VPC Network
####################################

# variable "environment" {
#   type = string
# }

# variable "vpc_cidr" {
#   type = string
# }

# variable "public_subnet_cidrs" {
#   type = list
# }

# variable "private_subnet_cidrs" {
#   type = list
# }

# variable "availability_zones" {
#   type = list
# }