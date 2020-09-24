FROM python:3.7.9-stretch

WORKDIR /hello-flask

COPY . /hello-flask

RUN make install
RUN ./hadolint Dockerfile


EXPOSE 80

CMD ["python","/hello-flask/hello.py"]
