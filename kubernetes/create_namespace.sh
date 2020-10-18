namespace=`kubectl get ns $1 -o name 2>/dev/null`

if [[ -z "$namespace" ]]; then
        echo "Creating namespace $namespace..."
        kubectl create namespace $namespace
else
        echo "Deleting $namespace..."
        kubectl delete namespace $namespace
fi
