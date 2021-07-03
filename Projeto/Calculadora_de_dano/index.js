const vidaPorInimigo = {
    'fera': 8,
    'aquatico': 10,
    'maligna': 12,
    'esqueleto': 20,
};

const danoPorHeroi = {
    'gorpo': 4,
    'gatoguerreiro': 8,
    'heman': 14,
};

let inimigoSelecionado;
let heroiSelecionado;

function iniciar() {
    const elementos = document.getElementsByClassName('elemento');

    for (const elemento of elementos) {
        elemento.addEventListener('click', marcarElementoSelecionado);
    }

    document.getElementById('calcular').addEventListener('click', calcularDano);
}

function marcarElementoSelecionado(evento) {
    const elementoSelecionado = evento.target.parentElement;
    
    if (!elementoSelecionado.classList.contains('elemento')) {
        return;
    }

    const idElementoSelecionado = elementoSelecionado.getAttribute('id');

    if (elementoSelecionado.classList.contains('inimigo')) {
        inimigoSelecionado = idElementoSelecionado;
        limparElementosSelecionados('inimigo');
    } else {
        heroiSelecionado = idElementoSelecionado;
        limparElementosSelecionados('heroi');
    }

    elementoSelecionado.classList.add('selecionado');
}

function calcularDano() {
    if (!inimigoSelecionado || !heroiSelecionado) {
        alert('Selecione o inimigo e o herói para calcular o dano');
        return;
    }

    const danoDados = rolarOsDados();
    const danoHeroi = danoPorHeroi[heroiSelecionado];
    const danoTotal = danoDados + danoHeroi;
    const vidaInimigo = vidaPorInimigo[inimigoSelecionado];

    let resultado = 'Dano: ' + danoTotal + '! ';

    if (danoTotal >= vidaInimigo) {
        resultado += 'Parabéns, você derrotou o/a ' + inimigoSelecionado;
    } else {
        resultado += 'Não desista!!!Você perdeu apenas uma batalha, tente novamente!';
    }

    document.getElementById('dano').innerHTML = resultado;
}

function limparElementosSelecionados(tipo) {
    const elementos = document.getElementsByClassName('elemento');

    for (const elemento of elementos) {
        if (elemento.classList.contains(tipo)) {
            elemento.classList.remove('selecionado');
        }
    }
}

function rolarOsDados() {
    const min = Math.ceil(1);
    const max = Math.floor(8);

    return Math.floor(Math.random() * (max - min + 1)) + min;
}
