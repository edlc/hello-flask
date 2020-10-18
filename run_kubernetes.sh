#!/usr/bin/env bash

# This runs the hello-flask container
# kubectl -n hello-flask run hello-flask --image=$dockerpath --port=8000
# kubectl -n hello-flask get pods
# kubectl -n hello-flask expose pod hello-flask --type=LoadBalancer --port=8111 --target-port=8000

dockerpath=cardene/hello-flask:$BUILD_NUMBER
appName=$1
namespace=`kubectl get ns $1 -o name 2>/dev/null`

if [[ -z "$namespace" ]]; then
        echo "Creating namespace $namespace..."
        kubectl create namespace $1
        kubectl apply -f kubernetes/hello-flask-deployment.yaml
        kubectl apply -f kubernetes/hello-flask-service.yaml
else 
        echo "Updating deployment $namespace..."
        kubectl -n $1 set image deployment $1-deployment $1=$dockerpath
fi