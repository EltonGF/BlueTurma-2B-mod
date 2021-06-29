from flask import Flask
from bp import bp
from bp2 import bp2

app = Flask(__name__)
app.register_blueprint(bp)
app.register_blueprint(bp2)


if (__name__ == "__main__"):
    app.run(debug=True)

# python -m flask run -> modo normal
# python app.py -> modo debug