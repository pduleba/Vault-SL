# HashiCorp Vault-SL - Exercise 04

### Introduction
HashiCorp Vault allows you to wrapping secret to provide additional level of security.
This way user/application do not hold actual secret but token which allows to access 
secret via cubbyhole. Secret is also available withing specified amount of time (TTL).


### Wrapping secrets
#### Scenario 1 (wrapping/unwrapping token on data PUT)
* `vault kv put secret/app-data app-key=app-secret-value` - let's put some secret data in Vault
* `vault kv get -wrap-ttl=600 secret/app-data` - wrapping data for 10 min (via `wrap-ttl`)
* `curl -H "X-Vault-Token: %WRAPPING_TOKEN%" -X POST http://127.0.0.1:8200/v1/sys/wrapping/unwrap | jq` - un-wrapping data using *wrapping token*

#### Scenario 2 (wrapping/unwrapping token policy scope)
Policy 
* `vault policy write dev-policy dev-policy.hcl` - create `dev-policy`
* `vault token create -policy=dev-policy -wrap-ttl=300` - creates token valid for 5 min with scope of `dev-policy` policy
* * `curl -H "X-Vault-Token: %WRAPPING_TOKEN%" -X POST http://127.0.0.1:8200/v1/sys/wrapping/unwrap | jq` - unwrapping of `5_MIN_TOKEN`
* * `curl -H "X-Vault-Token: %5_MIN_TOKEN%" -X POST --data @data.json http://127.0.0.1:8200/v1/dev/data/app-secret | jq` - SUCCESS (policy allows access)
* * `curl -H "X-Vault-Token: %5_MIN_TOKEN%" -X POST --data @data.json http://127.0.0.1:8200/v1/dev-another/data/app-secret | jq` - FAILURE (policy denies access)
