storage "file" {
  path = "./vault"
}

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = 1
}

disable_mlock = true
log_level = "trace"

api_addr = "http://127.0.0.1:8200"

# http://127.0.0.1:8200/ui
ui = true