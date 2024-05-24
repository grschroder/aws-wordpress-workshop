
## Instalando

Crie um arquivo chamado **terraform.tfvars** e preencha com as seguintes informações:


```config
AWS_ACCESS_KEY  = "access-key"
AWS_SECRET_KEY  = "access-secret"
AWS_REGION      = "region"
SSH_KEY_NAME    = "ssh-key-name"
DB_USERNAME     = "db-username"
DB_PASSWORD     = "db-password"
```

Após isso, rode o terraform utilizando **terraform plan** e **terraform apply**.

