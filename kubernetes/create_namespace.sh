namespace=`kubectl get ns $1 -o name 2>/dev/null`

if [[ -n "$namespace" ]]; then
        echo "Deleting namespace $namespace..."
        kubectl delete namespace $1
fi

kubectl createnamespace $1