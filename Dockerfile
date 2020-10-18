FROM python:3.7.9-stretch
FROM

WORKDIR /hello-flask

COPY . /hello-flask

RUN make installt
RUN ./hadolint Dockerfile

EXPOSE 8000

CMD ["python","/hello-flask/hello.py",]
