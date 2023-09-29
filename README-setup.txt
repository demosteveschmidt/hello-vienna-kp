## Setup

Change directory to kpack-setup
Login to the K8s cluster and set context
Make sure to prepare Harbor and the cluster as mentioned in the README.md
Run the ./do.sh script

Check Harbor
Check the status of the builder

Cleanup: ./undo.sh

## Demo

Change directory to hello-vienna

### Building

Apply the image specification

kubectl apply -f hello-vienna-image.yaml
kp image list -n dev-steve
kp build list -n dev-steve
kp build logs hello-vienna -n dev-steve -b 1

All done on the K8s cluster with kpack - no local references at all

### Running

The most simple manifest - yet still so many things we can talk about

kubectl apply -f hello-vienna-k8s.yaml
kubectl get pods -n cncf-meetup

curl hello-vienna.apps.tapmc.v2steve.net
