# curl -LO https://github.com/buildpacks-community/kpack/releases/download/v0.11.2/release-0.11.2.yaml
# minikube start
# kubectl config use-context minikube 
kubectl delete -f petclinic-image.yaml
kubectl delete -f node-image.yaml
kubectl delete -f builder.yaml
kubectl delete -f stack.yaml
kubectl delete -f store.yaml
kubectl delete -f dockerhub-service-account.yaml
kubectl delete -f dockerhub-registry-credentials.yaml
kubectl delete -f release-0.11.2.yaml
# curl -s -S 'https://registry.hub.docker.com/v2/repositories/paketobuildpacks/run-jammy-base/tags' | jq '.results[].name'

