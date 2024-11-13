#!/bin/bash

export pod_name=$(kubectl get pods -o json | jq -r ".items[] | select(.metadata.name | contains(\"postgresql\")) | .metadata.name")

# Run the SQL script on the PostgreSQL pod
kubectl exec -it $pod_name -- psql -d "mydatabase" -U "sangtd2" < 1_create_tables.sql
kubectl exec -it $pod_name -- psql -d "mydatabase" -U "sangtd2" < 2_seed_users.sql
kubectl exec -it $pod_name -- psql -d "mydatabase" -U "sangtd2" < 3_seed_tokens.sql

# Checking the tables
kubectl exec -it  $pod_name -- psql -d "mydatabase" -U "sangtd2" < 4_check_tables.sql
