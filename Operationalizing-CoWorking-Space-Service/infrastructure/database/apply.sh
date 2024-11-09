#!/bin/bash

kubectl apply -f pvc.yaml
kubectl apply -f pv.yaml
kubectl apply -f postgresql-deployment.yaml
kubectl apply -f postgresql-service.yaml
