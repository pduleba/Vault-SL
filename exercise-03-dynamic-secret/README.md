# HashiCorp Vault 01 - Exercise 01

### Introduction
HashiCorp Vault allows you to generate secrets on demand using `search engine` i.e. `kv`, `aws`, `database`.
Secret generated this way can be:
* *valid for specific duration* (`lease`)
* *duration can be extended/reviewed* (`renew`)
* *can be removed on request* (`revoke`)

### Generating secrets (using AWS search engine)
* `vault secrets enable -path=aws-pduleba aws` - create path of type `aws`
* `vault write aws-pduleba/config/root access_key=_USER_KEY_ secret_key=_USER_SEC_KEY_ region=eu-west-1` - configure path (AWS CLI)
* `vault write aws-pduleba/roles/s3-role credential_type=iam_user policy_document=@resource/policy.json` - create AWS role to be used
* `vault read aws-pduleba/creds/s3-role` - read AWS user 
* `vault lease revoke aws-pduleba/creds/s3-role/lp0FdEAbstn64DU1mPYj4KY4` - revoke secret

![Result](resource/generating-secrets-result.PNG?raw=true "Result")
