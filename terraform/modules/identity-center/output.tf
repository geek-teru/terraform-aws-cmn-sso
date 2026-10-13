output "identity_store_id" {
  value = local.identity_store_id
}

output "group_ids" {
  value = { for name, group in aws_identitystore_group.this : name => group.group_id }
}
