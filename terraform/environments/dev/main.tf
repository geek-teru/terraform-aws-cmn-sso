# ----------------------------------------
# Modules
# ----------------------------------------
module "identity-center" {
  source = "../../modules/identity-center"

  aws_account_id   = data.aws_caller_identity.current.account_id
  groups           = var.identity_center_groups
  admin_group_name = "aws-admins"
}

output "identity_center" {
  value = module.identity-center
}
