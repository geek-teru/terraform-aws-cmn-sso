# インスタンスはコンソールで有効化済み（組織インスタンス）。Terraform では参照だけする
data "aws_ssoadmin_instances" "this" {}

locals {
  instance_arn      = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
}

# ユーザーとグループへの所属はコンソールで管理する（ユーザー名をリポジトリに置かないため）
resource "aws_identitystore_group" "this" {
  for_each = var.groups

  identity_store_id = local.identity_store_id
  display_name      = each.key
  description       = each.value
}
