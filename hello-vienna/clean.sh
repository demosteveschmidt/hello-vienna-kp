#!/bin/bash

kubectl delete -f hello-vienna-k8s.yaml
kubectl delete -f hello-vienna-image.yaml

curl hello-vienna.apps.tapmc.v2steve.net