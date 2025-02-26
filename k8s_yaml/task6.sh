#!/bin/bash

kubectl rollout history deployment.apps/employees-deployment -n clo835
kubectl apply -f employee_deployment.yaml --record
kubectl rollout status deployment.apps/employees-deployment -n clo835
kubectl rollout history deployment.apps/employees-deployment -n clo835
kubectl describe deployment.apps/employees-deployment -n clo835
