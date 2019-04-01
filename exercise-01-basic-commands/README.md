# Hashicorp Vault 01 - Exercise 01

### Introduction
Hashicorp Vault is a server (accessible via API) for
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

### Generating secrets (using AWS search engine)
* `vault secrets enable -path=aws-pduleba aws` - create path of type `aws`
* `vault write aws-pduleba/config/root access_key=_USER_KEY_ secret_key=_USER_SEC_KEY_ region=eu-west-1` - configure path (AWS CLI)
* `vault write aws-pduleba/roles/s3-role credential_type=iam_user policy_document=@resource/policy.json` - create AWS role to be used
* `vault read aws-pduleba/creds/s3-role` - read AWS user 
* `vault lease revoke aws-pduleba/creds/s3-role/lp0FdEAbstn64DU1mPYj4KY4` - revoke secret

![Result](resource/generating-secrets-result.PNG?raw=true "Result")

### Help
* `vault path-help __VAULT_PATH__` - provides help for given path of given `search engine`
* * `vault path-help pduleba` - for custom path 
* * `vault path-help sys` - for system path
* * `vault path-help aws-pduleba/creds/my-non-existing-role` - inner path details
* `vault auth help __VAULT_PATH__` - provides help for authentication path
* * `vault auth help token` - for token auth 
* * `vault auth help aws` - for AWS auth 
* [Hashicorp Vault Documentation](https://www.vaultproject.io/docs/)
