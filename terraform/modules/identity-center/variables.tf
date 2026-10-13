variable "aws_account_id" {
  type = string
}

# グループ。キーは表示名、値は説明
variable "groups" {
  type = map(string)
}

# AdministratorAccess でこのアカウントに入れるグループ
variable "admin_group_name" {
  type = string
}
