docker build -t hello-flask:1.0 .
docker image ls
docker container run --name hello-flask -p 8111:8000 hello-flask:1.0
