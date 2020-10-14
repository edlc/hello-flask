aws eks --region ap-southeast-2 create-cluster --name $1 --role-arn arn:aws:iam::888486441568:role/EksClusterRole --kubernetes-version 1.17 --resources-vpc-config subnetIds=$2,$3,securityGroupIds=$4
