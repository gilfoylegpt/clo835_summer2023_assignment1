#!/bin/bash
#

kubectl apply -f mysql_pod.yaml
kubectl apply -f mysql_service.yaml
sleep 5
kubectl apply -f employee_pod.yaml
sleep 10
nohup kubectl port-forward employees -n clo835 8080:8080 > /dev/null 2>&1 &

