#!/usr/bin/env bash

# This runs the hello-flask container
dockerpath=cardene/hello-flask:1.0
kubectl -n hello-flask run hello-flask --image=$dockerpath --port=8000
kubectl -n hello-flask get pods
kubectl -n hello-flask expose pod hello-flask --type=LoadBalancer --port=8111 --target-port=8000
