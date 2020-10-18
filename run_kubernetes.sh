#!/usr/bin/env bash

# This runs the hello-flask container
# kubectl -n hello-flask run hello-flask --image=$dockerpath --port=8000
# kubectl -n hello-flask get pods
# kubectl -n hello-flask expose pod hello-flask --type=LoadBalancer --port=8111 --target-port=8000

dockerpath=cardene/hello-flask:$BUILD_NUMBER
appName=$1
namespace=`kubectl get ns $appName -o name 2>/dev/null`

if [[ -z "$namespace" ]]; then
        echo "Creating namespace $namespace..."
        kubectl create namespace $appName
        kubectl apply -f kubernetes/hello-flask-deployment.yaml
        kubectl apply -f kubernetes/hello-flask-service.yaml
else 
        echo "Updating deployment $namespace..."
        kubectl -n $appName set image deployment $appName-deployment $appName=$dockerpath
fi
kubectl -n $appName get services