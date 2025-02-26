#!/bin/bash

kubectl cluster-info --context kind-kind
kubectl get pod -n kube-system 

