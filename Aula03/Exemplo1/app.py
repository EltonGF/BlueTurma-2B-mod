from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<h1>Hello, Flask! Olha a T2C3 na área!</h1> <br /> <h3>Parabéns, você conseguiu...!! </h3>"

@app.route("/rota2/<nome>")
def rota2(nome=None):
    return "<h3>Muito bem "+nome+", essa é a sua primeira aplicação com uso de Flask com 2 rotas."
    
if (__name__ == "__main__"):
    app.run(debug=True)   