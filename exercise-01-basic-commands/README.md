# HashiCorp Vault 01 - Exercise 01

### Introduction
HashiCorp Vault is a server (accessible via API) for
* secrets management
* data protection
Possible ways of accessing Vault Server
* via vault.exe
* via API
* via Vault UI (http://127.0.0.1:8200)

Vault is driven by search engine. They are allowing to access virtual filesystem.
This way same interface driven by different search engines allows to access secrets
from many kinds of sources i.e. AWS/Azuer/DB etc. Here are example how to create it:
* `kv` - default 
* * `vault secrets enable -path=pduleba kv` - create new search engine of type `kv`
* * `vault secrets list` - check status including search engine types available
* * `vault list pduleba/app` - see content of path
* `aws` - search inside AWS
* `database` - search inside database

### Running Vault
* `vault server -dev` - to start Vault server, once running
* * `set VAULT_ADDR=http://127.0.0.1:8200`
* * `set VAULT_TOKEN=your_token_key`
* `vault login` - login into Vault
* * token can be re-generated via `vault token create`
* `vault status` - to check server status

### Interacting with Vault (via vault.exe)
* `exec-cmd-post.bat` - put/update secret
* `exec-cmd-get.bat` - get secret
* `exec-cmd-delete.bat` - delete secret

### Interacting with Vault (via API)
* `exec-api-post.bat` - put/update secret
* `exec-api-get.bat` - get secret
* `exec-api-delete.bat` - delete secret

### Help
* `vault path-help __VAULT_PATH__` - provides help for given path of given `search engine`
* * `vault path-help pduleba` - for custom path 
* * `vault path-help sys` - for system path
* * `vault path-help aws-pduleba/creds/my-non-existing-role` - inner path details
* `vault auth help __VAULT_PATH__` - provides help for authentication path
* * `vault auth help token` - for token auth 
* * `vault auth help aws` - for AWS auth 
* [HashiCorp Vault Documentation](https://www.vaultproject.io/docs/)
