resource "aws_ssoadmin_permission_set" "admin" {
  instance_arn     = local.instance_arn
  name             = "AdministratorAccess"
  session_duration = "PT8H"
}

resource "aws_ssoadmin_managed_policy_attachment" "admin" {
  instance_arn       = local.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# 管理者グループに、このアカウントへの AdministratorAccess を割り当てる
resource "aws_ssoadmin_account_assignment" "admin" {
  instance_arn       = local.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn

  principal_type = "GROUP"
  principal_id   = aws_identitystore_group.this[var.admin_group_name].group_id

  target_type = "AWS_ACCOUNT"
  target_id   = var.aws_account_id

  # ポリシーが付いてから割り当てる（付く前だと空の権限で配られる）
  depends_on = [aws_ssoadmin_managed_policy_attachment.admin]
}
