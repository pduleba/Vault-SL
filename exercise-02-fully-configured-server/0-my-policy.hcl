# Normal servers have version 1 of KV mounted by default, so will need these
# paths:
path "secret/*" {
  capabilities = ["create", "update", "read"]
}
path "secret/private" {
  capabilities = ["read"]
}
