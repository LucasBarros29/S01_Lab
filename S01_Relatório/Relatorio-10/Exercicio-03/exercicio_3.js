// Classe que representa o registro de uma única criatura no diário
class RegistroCriatura {
    constructor(especie, grauPerigo) {
        this.especie = especie;       // Nome da criatura (Gnomo, Zumbi...)
        this.grauPerigo = grauPerigo; // Nota de perigo, de 1 a 10
    }

    // Monta o texto que resume o registro
    resumir() {
        return `Criatura: ${this.especie} | Nível de perigo: ${this.grauPerigo}`;
    }
}

// Classe que guarda e exibe uma coleção de registros
class Caderno {
    // Lista privada: os registros só são manipulados por métodos da classe
    #registros = [];

    constructor(edicao) {
        this.edicao = edicao; // Número do diário
    }

    // Composição: o caderno cria e armazena os registros internamente
    registrar(especie, grauPerigo) {
        const novoRegistro = new RegistroCriatura(especie, grauPerigo);
        this.#registros.push(novoRegistro);
    }

    // Exibe o título do diário e depois cada registro
    mostrarRegistros() {
        console.log(`Diário número ${this.edicao}`);

        this.#registros.forEach(registro => {
            console.log(registro.resumir());
        });
    }
}

// Classe simples que representa um funcionário da cabana
class Colaborador {
    constructor(nomeCompleto, funcao) {
        this.nomeCompleto = nomeCompleto; // Nome do funcionário
        this.funcao = funcao;             // Cargo exercido
    }
}

// Classe que representa o local e gerencia sua equipe
class PontoTuristico {
    // Lista privada de funcionários contratados
    #equipe = [];

    constructor(proprietario) {
        this.proprietario = proprietario;
    }

    // Adiciona um novo colaborador à equipe
    admitir(colaborador) {
        this.#equipe.push(colaborador);
    }

    // Exibe a mensagem de abertura e lista a equipe
    abrir() {
        console.log(`A Cabana do Mistério abriu! Dono: ${this.proprietario}`);

        this.#equipe.forEach(colaborador => {
            console.log(`${colaborador.nomeCompleto} - ${colaborador.funcao}`);
        });
    }
}

// Criação do diário e anotação das criaturas
const cadernoMisterioso = new Caderno(3);

cadernoMisterioso.registrar('Gnomo', 4);
cadernoMisterioso.registrar('Bill Cipher', 10);
cadernoMisterioso.registrar('Zumbi', 7);

cadernoMisterioso.mostrarRegistros();

// Criação dos funcionários
const colaboradorDipper = new Colaborador('Dipper', 'Pesquisador');
const colaboradorMabel = new Colaborador('Mabel', 'Atendente');

// Criação da cabana e contratação da equipe
const cabanaPrincipal = new PontoTuristico('Stanley Pines');

cabanaPrincipal.admitir(colaboradorDipper);
cabanaPrincipal.admitir(colaboradorMabel);

cabanaPrincipal.abrir();
