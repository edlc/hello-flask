dockerpath=cardene/hello-flask:1.0
echo "Docker ID and Image: $dockerpath"
#Use when user is not logged in
#cat my_password.txt | docker login --username cardene --password-stdin
docker build -t $dockerpath .
docker push $dockerpath
