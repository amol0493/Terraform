# How to implement this 


tree structure: -


├── dev.tfvars
├── main.tf
├── modules
│   ├── ec2_instance
│   │   └── main.tf
│   └── vpc
│       └── main.tf
├── prod.tfvars
├── stage.tfvars
└── terraform.tfstate.d
    ├── dev
    │   ├── terraform.tfstate
    │   └── terraform.tfstate.backup
    ├── prod
    │   ├── terraform.tfstate
    │   └── terraform.tfstate.backup
    └── stage


Steps: -

1) terraform workspace new dev

2) terraform workspace new prod

3) terraform workspace new stage

4) terraform workspace select dev

5) terraform workspace show

6) terraform init

7) terraform apply -var-file=dev.tfvars

8) terraform destroy -var-file=dev.tfvars
