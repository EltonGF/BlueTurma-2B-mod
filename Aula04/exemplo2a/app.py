from flask import Flask, render_template

app = Flask(__name__)
@app.route("/")
def index():
    nome = "Elton"
    idade = 38
    if idade >= 18:
        maioridade = True
    else:
        maioridade = False
    cidade = "Piracicaba"

    imagem ="/static/blue.jpg"
    return render_template('index.html', nome=nome, idade=idade, cidade=cidade,imagem=imagem)
    
    if (__name__ == "__main__"):
        app.run(debug=True)

