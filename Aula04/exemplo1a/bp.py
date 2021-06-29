from flask import Blueprint, render_template

bp = Blueprint('bp',__name__)

@bp.route("/")
def home():
    return "<h1>Hello, Flask!!!</h1>"

@bp.route("/login/<nome>")
def login(nome=None):
    return "<center><h1>Olá, "+nome+"! <br /> Faça seu login:</h1>"

@bp.route("/auladeontem/")
def carrega():
    return render_template("aula2_ex1_v2.html")

@bp.route("/clientes/")
def home0():
    return "<h1>Home clientes</h1>"

@bp.route("/produtos")
def home1():
    return "<h1>Home produtos</h1>"

@bp.route("/contatos")
def home2():
    return "<h1>Home contatos</h1>"

