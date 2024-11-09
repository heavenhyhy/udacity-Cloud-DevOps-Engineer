#!/bin/bash

eksctl create cluster --name sangtd2 --region us-east-1 --nodegroup-name my-nodes --node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2

aws eks --region us-east-1 update-kubeconfig --name sangtd2

# Export the result
current_context=$(kubectl config current-context)
export CURRENT_CONTEXT="$current_context"
echo "Current Kubernetes context: $CURRENT_CONTEXT"

kubectl config view
