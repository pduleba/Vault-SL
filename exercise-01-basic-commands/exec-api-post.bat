curl --header "X-Vault-Token:%VAULT_TOKEN%" --request POST --data @resource/pduleba_secret_data.json %VAULT_ADDR%/v1/secret/app/data