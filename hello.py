from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello flask!!! \n This is BLUE deployment.'


@app.route('/login')
def login():
    test
    return 'NEW - This is the login page'


@app.route('/user/<username>')
def show_user_profile(username):
    return 'User {0}'.format(username)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000, debug=True)  # specify port=8000
