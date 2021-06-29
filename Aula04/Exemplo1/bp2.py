from flask import Blueprint, render_template

bp2 = Blueprint('bp2',__name__)

@bp2.route("/auladeontem/")
def carrega():
    return render_template('aula2_ex1_v2.html')