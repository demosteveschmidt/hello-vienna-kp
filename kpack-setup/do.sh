# curl -LO https://github.com/buildpacks-community/kpack/releases/download/v0.11.2/release-0.11.2.yaml
# be sure to run ". kenv" and "klogin tdh-vsphere-tkgs-sschmidt-svc" before running this
kubectl create ns dev-steve
kubectl config use-context tdh-vsphere-tkgs-sschmidt-svc
kubectl apply -f release-0.11.2.yaml
kubectl apply -f harbor-registry-credentials.yaml
kubectl apply -f harbor-service-account.yaml
kubectl apply -f store.yaml
curl -s -S 'https://registry.hub.docker.com/v2/repositories/paketobuildpacks/run-jammy-base/tags' | jq '.results[].name'
kubectl apply -f stack-0.1.64.yaml
kubectl apply -f builder.yaml
kubectl apply -f hello-vienna-image.yaml
# docker run --rm --tty -p 8080:8080 harbor.apps.tapmc.v2steve.net/demosteveschmidt/hello-vienna@sha256:51bf4acf169fe854f8ad19f9346469a9729ddb472b6e067d8ec778435ec5b66f
# or kubectl apply -f hello-vienna.yaml ???
# curl localhost:8080
