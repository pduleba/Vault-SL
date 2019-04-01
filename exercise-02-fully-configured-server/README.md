# Hashicorp Vault 01 - Exercise 02

### Introduction
This demonstrates how to run Vault server with:
* initializing
* unsealing
* initializing `dev` secret driven by `kv` search engine
* defining policies with proper scope
* enabling UI (http://127.0.0.1:8200)

### How to run it
* * `vault server -config=vault.hcl` - start Vault server
* `curl -X POST --data @1-data-unseal.json http://127.0.0.1:8200/v1/sys/init | jq` - initialize Vault server
* * `set VAULT_ADDR=http://127.0.0.1:8200` - export addres (skip default HTTPs)
* * `set VAULT_TOKEN=s.4HQUDHPFvSjTouuFxwhqwwy1` - export root tooken
* `curl -X POST --data @2-data-unseal-key.json http://127.0.0.1:8200/v1/sys/unseal | jq` - unseal Vault server
* * `vault login %VAULT_TOKEN%` - log in as root
* * `vault policy write my-policy 0-my-policy.hcl` - create custom user policy
* * `vault policy write dev-policy 0-dev-policy.hcl` - create development policy
* * `vault policy list` - verity results
* `curl -H "X-Vault-Token: %VAULT_TOKEN%" -X POST --data @3-data-enable-app-role.json http://127.0.0.1:8200/v1/sys/auth/approle` - enable role (authentication endpoint path)
* `curl -H "X-Vault-Token: %VAULT_TOKEN%" -X POST --data @4-data-create-app-role.json http://127.0.0.1:8200/v1/auth/approle/role/dev-role` - create role (with desired set of ACL policies)
* `curl -H "X-Vault-Token: %VAULT_TOKEN%" http://127.0.0.1:8200/v1/auth/approle/role/dev-role/role-id | jq` - get role-id
* `curl -H "X-Vault-Token: %VAULT_TOKEN%" -X POST http://127.0.0.1:8200/v1/auth/approle/role/dev-role/secret-id | jq` - create new secret ud for role-id
* `curl -X POST --data @5-data-create-token-by-role-id-and-secret-id.json http://127.0.0.1:8200/v1/auth/approle/login | jq` - use role-id and secret-id to get Vault token
* `curl -H "X-Vault-Token: %VAULT_TOKEN%" -X POST --data @6-data-create-dev_engine.json http://127.0.0.1:8200/v1/sys/mounts/dev` - create new Search Engine
* * `set VAULT_TOKEN=s.8YRzwqjLVhk8jdNV91NA3MMm` - export policy token for approle
* `curl -H "X-Vault-Token: %VAULT_TOKEN%" -X POST --data @7-data.json http://127.0.0.1:8200/v1/dev/data/app-secret | jq` - put some data inside vault
* `curl -H "X-Vault-Token: %VAULT_TOKEN%" http://127.0.0.1:8200/v1/dev/data/app-secret | jq` - put some data inside vault

