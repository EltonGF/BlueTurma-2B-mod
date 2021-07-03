from flask import Flask, render_template, request
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

    @staticmethod
    def read_single(id_registro):
        return Filmes.query.get(id_registro)

    @staticmethod
    def conta():        
        return Filmes.query.count()

    def save(self):
        db.session.add(self)
        db.session.commit()

    def update(self, novo_nome, nova_imagem_url):
        self.nome = novo_nome 
        self.imagem_url = nova_imagem_url

        self.save()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

@app.route("/")
def index():
    total=Filmes.conta()
    return render_template("index.html", total=total)

@app.route("/read")
def read_all():    
    registros = Filmes.read_all()
    return render_template("read_all.html", registros=registros)

@app.route("/read/<id_registro>")
def read_id(id_registro):
    registro = Filmes.read_single(id_registro)    
    return render_template("read_single.html", registro=registro)

@app.route("/create", methods=('GET', 'POST'))
def create():
    novo_id= None

    if request.method == 'POST':
        form = request.form

        registro = Filmes(form['nome'], form['imagem_url'])
        registro.save()

        novo_id = registro.id

    return render_template("create.html", novo_id = novo_id)

@app.route('/update/<id_registro>', methods=('GET', 'POST'))
def update(id_registro):
    sucesso = False

    registro = Filmes.read_single(id_registro) 

    if request.method == 'POST':
        form = request.form 
        registro.update(form['nome'], form['imagem_url']) 
        sucesso = True
    
    return render_template('update.html', registro=registro, sucesso=sucesso)

@app.route('/delete/<id_registro>')
def delete(id_registro):
    registro = Filmes.read_single(id_registro) # recupera o registro com id passado na rota
    return render_template("delete.html", registro=registro) # carrega a página de confirmação

@app.route('/delete/<id_registro>/confirmed')
def delete_confirmed(id_registro):
    sucesso = False 

    registro = Filmes.read_single(id_registro) # recupera o registro com id passado na rota

    if registro:
        registro.delete() # chama a função delete para apagar o registro
        sucesso = True # muda o valor da variável sucesso

    return render_template("delete.html", registro=registro, sucesso=sucesso)

if (__name__ == "__main__"):
    app.run(debug=True)
