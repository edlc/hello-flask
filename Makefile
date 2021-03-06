setup: 
	python3 -m venv ~/.hello-flask

install: 
	pip install --upgrade pip && pip install -r requirements.txt

lint:
	pylint --disable=R,C,W1203 hello.py


all: install lint

