S1
-------------
This solution is for creating a 3-tier application architecture using terraform on Azure cloud.
### Prerequisite
-   Install [Terraform]
-   Install [Azure Cli]
-   Create Service Principal with contributer access on your subscription scope

Usage:
--------
```
az ad sp create-for-rbac --name "SPForTerraformKpmgTest" --role "Contributor" --scopes="/subscriptions/5c265d3c-ff46-4102-8c22-6ea6615689ad"
export ARM_CLIENT_SECRET="XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
./terraform.exe init
./terraform.exe plan --var="mysql_db_pass=Jiten@1987"
./terraform.exe apply --var="mysql_db_pass=Jiten@1987" --auto-approve
./terraform.exe destroy --var="mysql_db_pass=Jiten@1987"
```

The Terraform resources will consists of following structure:
--------
-   main.tf - Entrypoint for terraform resources.
-   varibale.tf - It contain the declarations for variables.
-   locals.tf - It contain the local variable.
-   terraform.tfvars - The file to pass the terraform variables values.
-   provider.tf - terraform provider
-   /modules - modules

Modules
--------
For this solution, I have created and used six modules:
1. resourceGroup - creating resourcegroup
2. networking - creating azure virtual network and required subnets
3. securityGroup - creating network security group, setting desired security rules and associating them to subnets
4. virtualMachine - creating availability sets, network interfaces and virtual machines
5. database - creating database server and database
6. publicIP - crateing a public ip


Result
-------
result folder container 
1. terraform.tfstate: terraform state file after apply
2. terraform_apply_and_destroy_logs.txt: logs of terraform apply and destroy
