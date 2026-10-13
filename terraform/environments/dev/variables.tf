variable "env" {
  type    = string
  default = "dev"
}

variable "service_name" {
  type    = string
  default = "cmn"
}

data "aws_caller_identity" "current" {}

# Identity Center のグループ。キーは表示名、値は説明。所属はコンソールで管理する
variable "identity_center_groups" {
  type = map(string)
  default = {
    aws-admins    = "AWS アカウントの管理者（コンソールと CLI）"
    argocd-admins = "Argo CD の管理者"
  }
}
