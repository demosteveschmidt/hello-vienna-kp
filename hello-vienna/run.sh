#!/bin/bash

# docker run --rm --tty -p 8080:8080 harbor.apps.tapmc.v2steve.net/demosteveschmidt/hello-vienna@sha256:51bf4acf169fe854f8ad19f9346469a9729ddb472b6e067d8ec778435ec5b66f

kubectl apply -f hello-vienna-k8s.yaml
kubectl get ingress -n cncf-meetup

curl hello-vienna.apps.tapmc.v2steve.net
