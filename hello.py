from flask import Flask
from markupsafe import escape

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello flask!!!'

@app.route('/login')
def login():
    return 'This is the login page'

@app.route('/user/<username>')
def show_user_profile(username):
    # show the user profile for that user
    print("Username: ", username)
    return 'User {0}'.format(username)
