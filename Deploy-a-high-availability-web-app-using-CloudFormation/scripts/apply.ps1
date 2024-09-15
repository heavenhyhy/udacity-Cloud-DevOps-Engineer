cd ../infrastructure;
terraform init;
terraform apply -var "region=us-east-1";
cd ../scripts;