# How to run Terraform scripts
1. Run `terraform init` (this will download the necessary files to allow you to perform the terraform scripts)
2. Run `terraform workspace list` (check that you are in the right workspace otherwise create one)
3. Run `terraform plan` (check that the plan does destroy, create or update resources as you expect)
4. Once you are happy with the plan run `terraform apply` (sit back, and go for a coffee)
5. Once it has been completed without errors, check from AWS web interface if everything has been created as you expected
6. Connect in SSH using the pem file cse-cnr.pem from cloud-common project