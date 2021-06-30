from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

user = 'bvgnnege'
password = 'PPwAIqC3YU8_M4yRP5mWpjliItDnkvhD'
host ='tuffi.db.elephantsql.com'
database = 'bvgnnege'

app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://{user}:{password}@{host}/{database}'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = "Very nice Secret Key"

db = SQLAlchemy(app)

class Filmes(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(255), nullable=False)
    imagem_url = db.Column(db.String(255), nullable=False)

    def __init__(self, nome, imagem_url):
        self.nome = nome
        self.imagem_url = imagem_url
    
    @staticmethod
    def read_all():
        return Filmes.query.order_by(Filmes.id.asc()).all()

@app.route("/")
def index():
    return render_template("index.html")


@app.route("/read")
def read_all():    
    registros = Filmes.read_all()
    return render_template("read_all.html", registros=registros)


@app.route("/read/<id_registro>")
def read_id(id_registro):
    return "Em construção - Visualizar registro de ID "+id_registro


@app.route("/create")
def create():
    return "CREATE ainda será criado"


if (__name__ == "__main__"):
    app.run(debug=True)
