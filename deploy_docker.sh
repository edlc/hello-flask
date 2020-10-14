kubectl create namespace hello-flask
kubectl apply -f kubernetes/hello-flask-deployment.yaml
kubectl apply -f kubernetes/hello-flask-service.yaml

