# Installation and demo of kpack

Modified to deploy to TKG cluster tdh-vsphere-tkgs-sschmidt-svc and Harbor
- harbor.apps.tapmc.v2steve.net

NOTE: manually create two projects on Harbor: ws-builder, demosteveschmidt
WARNING: did not work with ws-builder, therefore switched to "library/ws-builder" for the builder

The installation follows the getting started from the kpack tutorial. Reference: https://github.com/buildpacks-community/kpack/blob/main/docs/tutorial.md

To ease development and testing, two scripts are provided. One to install `do.sh` and the other to de-install `undo.sh`.

## Install

`./do.sh` 

This will automatically install the following
- kpack release
- create docker registry credentials and attach to the service account
- create clusterstore `default`
- create clusterstack `base` with a slightly older version
- create builder `ws-builder`
- create image `hello-node`

## What was built

After the install
- a builder image was created and pushed to Harbor
- an image for the hello-vienna Spring Boot app was built and pushed to Harbor

This can be shown by running various `kp` commands.

It can also be verified on the Harbor webpage.

## Build on commit

To trigger a re-build of the image due to source code changes, go to github.com, change the hello message and commit.

Be patient and watch the new build reason with `kp build list`.

With `kp build list` and `kp build logs` the progress can be shown. Once the image is ready, be sure to specify the new tag or sha with the `docker run` to make sure the new image is pulled.

## Build on stack update

What if an update of the base image is needed? Think OpenSSL. The installation created a slightly older stack based on version 0.1.64 of the images. To use the latest images, apply the stack.yaml file that does not specify a version with `kubectl apply -f stack.yaml`.

Observer the new build and build reason with `kp build list`

## Building Java

A Java / Spring Boot build can be triggered by creating the petclinic image with `kubectl apply -f petclinic-image.yaml`. This will take a bit longer than the JavaScript build.

## Variation with missing buildpack

To see what happens if we do not have the required buildpacks in our builder, you can remove the Java buildpack from the builder and the store. This will let you build a node.js example but will fail to build the hello-vienna

## Cleanup

bash undo.sh
