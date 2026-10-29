// Classe base que representa um Pokémon genérico
class Criatura {
    // Atributo privado: só pode ser acessado dentro da própria classe
    #pontosVida;

    constructor(nome, elemento, vidaTotal) {
        this.nome = nome;           // Apelido do Pokémon
        this.elemento = elemento;   // Tipo do Pokémon (Água, Planta...)
        this.#pontosVida = vidaTotal;
    }

    // Getter: permite ler a vida sem permitir alteração direta
    get vida() {
        return this.#pontosVida;
    }

    // Reduz a vida, garantindo que nunca fique abaixo de zero
    receberDano(valorDano) {
        this.#pontosVida = Math.max(0, this.#pontosVida - valorDano);
        console.log(`${this.nome} ficou com ${this.#pontosVida} de vida.`);
    }

    // Ataque padrão (pode ser sobrescrito pelas subclasses)
    atacar(oponente) {
        console.log(`${this.nome} atacou ${oponente.nome}!`);
        oponente.receberDano(10);
    }
}

// Subclasse do tipo Água
class Squirtle extends Criatura {
    constructor(nome, vidaTotal) {
        super(nome, 'Água', vidaTotal);
    }

    // Polimorfismo: ataque próprio, com dano de 20
    atacar(oponente) {
        console.log(`${this.nome} usou Jato de Água contra ${oponente.nome}!`);
        oponente.receberDano(20);
    }
}

// Subclasse do tipo Planta
class Bulbasaur extends Criatura {
    constructor(nome, vidaTotal) {
        super(nome, 'Planta', vidaTotal);
    }

    // Polimorfismo: ataque próprio, com dano de 15
    atacar(oponente) {
        console.log(`${this.nome} usou Chicote de Vinha contra ${oponente.nome}!`);
        oponente.receberDano(15);
    }
}

// Criação dos objetos
const pokemonAgua = new Squirtle('Tartaruga', 100);
const pokemonPlanta = new Bulbasaur('Folhinha', 30);

// Sequência de batalha
pokemonPlanta.atacar(pokemonAgua);
pokemonAgua.atacar(pokemonPlanta);
pokemonAgua.atacar(pokemonPlanta);

// Exibe a vida final de cada Pokémon
console.log(`Vida do ${pokemonAgua.nome}: ${pokemonAgua.vida}`);
console.log(`Vida do ${pokemonPlanta.nome}: ${pokemonPlanta.vida}`);
