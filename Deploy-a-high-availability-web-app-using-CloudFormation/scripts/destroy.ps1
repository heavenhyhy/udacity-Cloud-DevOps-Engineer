cd ../infrastructure;
terraform init;
terraform destroy -var "region=us-east-1";
cd ../scripts;