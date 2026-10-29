// Classe base: qualquer Hunter capaz de usar Nen
class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome; // Nome do Hunter
    }

    // Ataque genérico (as subclasses sobrescrevem este método)
    atacar(alvo) {
        console.log(`${this.nome} lançou um ataque genérico de aura contra ${alvo.nome}!`);
    }
}

// Tipo Intensificador: reforça o corpo com aura
// Sem constructor próprio: herda o da classe base
class Intensificador extends UsuarioDeNen {
    // Polimorfismo: ataque típico do tipo
    atacar(alvo) {
        console.log(`${this.nome} concentrou sua aura nos punhos e atacou ${alvo.nome}!`);
    }
}

// Tipo Transmutador: muda a natureza da aura
class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transformou sua aura em eletricidade e atacou ${alvo.nome}!`);
    }
}

// Tipo Materializador: cria objetos a partir da aura
class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} materializou uma corrente e atacou ${alvo.nome}!`);
    }
}

// Representa um membro da Trupe Fantasma
class Aranha {
    constructor(nome, numero) {
        this.nome = nome;     // Nome do membro
        this.numero = numero; // Número tatuado
    }
}

// Agregação: a trupe recebe aranhas já criadas, não as cria
class TrupeFantasma {
    // Atributo privado: só os métodos da classe acessam a lista
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    // Mostra a cidade e percorre as aranhas com forEach
    revelarAranhas() {
        console.log(`Aranhas avistadas em ${this.cidade}:`);

        this.#aranhas.forEach(aranha => {
            console.log(`Número ${aranha.numero}: ${aranha.nome}`);
        });
    }

    // Usa find para retornar a aranha com o número informado
    buscarAranha(numero) {
        return this.#aranhas.find(aranha => aranha.numero === numero);
    }
}

// ----- Main -----

// Duas aranhas criadas antes da trupe
const aranhaLider = new Aranha('Chrollo', 0);
const aranhaEspadachim = new Aranha('Feitan', 2);

// Trupe criada com a cidade e o array de aranhas
const trupeEmYorknew = new TrupeFantasma('Yorknew', [aranhaLider, aranhaEspadachim]);

trupeEmYorknew.revelarAranhas();

// Busca uma das aranhas pelo número
const aranhaEncontrada = trupeEmYorknew.buscarAranha(2);

// Só ataca se a aranha foi encontrada
if (aranhaEncontrada) {
    // Um usuário de Nen de cada tipo
    const grupoDeHunters = [
        new Intensificador('Gon'),
        new Transmutador('Killua'),
        new Materializador('Kurapika')
    ];

    // Cada Hunter ataca do seu jeito (polimorfismo)
    grupoDeHunters.forEach(hunter => {
        hunter.atacar(aranhaEncontrada);
    });
}
