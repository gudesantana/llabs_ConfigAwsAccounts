#####################################
# Global Variables
#####################################

environment    = "hml"
aws_region     = "us-east-1"
aws_profile    = "default"
aws_account_id = "605134474476"
project_name   = "llabs_aws"
account_name   = "localiza-labs-hml"

#####################################
# IAM Password Policies Variables
#####################################

allow_users_to_change_password = true
minimum_password_length        = 10
require_lowercase_characters   = true
require_numbers                = true
require_symbols                = true
require_uppercase_characters   = true
max_password_age               = 365
hard_expiry                    = false
password_reuse_prevention      = 5

#####################################
# EventBridge and SNS
######################################

sns_email = "llabs-hml@good.tec.br"

#####################################
# VPC Network
#####################################

# vpc_cidr = "10.60.0.0/22"
# private_subnet_cidrs = ["10.60.0.0/24", "10.60.2.0/24"]
# public_subnet_cidrs = ["10.60.1.0/24", "10.60.3.0/24"]
# availability_zones = ["us-east-1a", "us-east-1c"]
