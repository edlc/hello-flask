namespace=`kubectl get ns $1 -o name 2>/dev/null`
echo "Namespace: $namespace"
kubectl get namespace $1
if [[ -z "$namespace" ]]; then
        echo "Creating namespace $namespace..."
        kubectl create namespace $1
else 
        echo "Re-creating namespace $namespace..."
        kubectl delete namespace $1
        kubectl create namespace $1
fi

