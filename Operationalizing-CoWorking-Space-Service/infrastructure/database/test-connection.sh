#!/bin/bash

pod_name=$(kubectl get pods -o json | jq -r ".items[] | select(.metadata.name | contains(\"postgresql\")) | .metadata.name")

kubectl exec -it $pod_name -- bash

psql -U sangtd2 -d mydatabase

\l
