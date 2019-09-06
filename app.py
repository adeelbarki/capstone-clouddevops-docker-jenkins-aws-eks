from flask import Flask

APP = Flask(__name__)


@APP.route("/")
def home():
    html = f"<h3>Hello Udacity!</h3><p>This is Adeel Barki</p>"
    return html.format(format)


if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=80, debug=True) # specify port=80
