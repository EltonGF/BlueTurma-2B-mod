from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/", methods=('GET','POST'))
def index():
    nome = None
    sobrenome =None
    criatura = None
    imagem = None

    if request.method == 'GET':
        nome = request.form['nome']
        sobrenome = request.form['sobrenome']
        criatura = request.form['criatura']

        if criatura == "elfo":
            imagem = "..."
        elif criatura == "orc":
            imagem = "..."
        elif criatura == "hobbit":
            imagem = "..."
        else:
            imagem == None

    return render_template("index.html")

if (__name__ == "__main__"):
    app.run(debug=True)