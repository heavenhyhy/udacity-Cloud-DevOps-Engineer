cd ../infrastructure;
terraform init;
terraform destroy -var "region=us-east-1" --auto-approve;
cd ../scripts;