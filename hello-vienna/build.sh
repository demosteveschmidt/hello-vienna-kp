#!/bin/bash

kubectl apply -f hello-vienna-image.yaml
kp image list -A
kp build list -n dev-steve

kp build logs hello-vienna -b 1 -n dev-steve
