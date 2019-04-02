# Normal servers have version 1 of KV mounted by default, so will need these
# paths:
path "dev/*" {
  capabilities = ["create", "list"]
}
path "dev/data/*" {
  capabilities = ["create", "read", "update", "delete"]
}
path "dev/data/secret" {
  capabilities = ["read"]
}
path "dev/metadata/*" {
  capabilities = ["list"]
}
