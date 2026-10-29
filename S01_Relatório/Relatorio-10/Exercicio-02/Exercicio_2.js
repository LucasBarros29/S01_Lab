// Parte composta: a pistola pertence ao agente e é criada junto com ele
class Pistola {
    constructor(modelo) {
        this.modelo = modelo; // Modelo da arma (Ghost, Sheriff...)
    }
}

// Classe base (contrato): define o que todo agente deve ter e fazer
class AgenteProtocolo {
    // Atributo privado: a pistola só é acessível dentro da classe
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome; // Atributo público
        // Composição: a Pistola é criada dentro do constructor
        this.#pistola = new Pistola(modeloDaPistola);
    }

    // Contrato: toda classe filha precisa sobrescrever este método
    usarHabilidade() {
        throw new Error('A classe filha deve implementar usarHabilidade().');
    }

    // Chama a habilidade da filha (polimorfismo) e exibe a entrada em combate
    entrarEmCombate() {
        const textoHabilidade = this.usarHabilidade();
        console.log(`${this.codinome} entrou em combate com ${this.#pistola.modelo}. Habilidade: ${textoHabilidade}`);
    }
}

// Função Controlador: bloqueia a visão dos inimigos
// Sem constructor próprio: herda o da classe base
class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Fumaça lançada para bloquear a visão dos inimigos.';
    }
}

// Função Iniciador: coleta informações sobre os inimigos
class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Dispositivo de reconhecimento ativado para localizar inimigos.';
    }
}

// Função Duelista: ataque direto
class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'Avanço ofensivo para eliminar os adversários.';
    }
}

// Agregação: o esquadrão recebe agentes já criados, não os cria
class Esquadrao {
    // Lista privada de agentes
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    // Mostra o nome do esquadrão e coloca cada agente em combate
    iniciarPartida() {
        console.log(`Esquadrão ${this.nome} iniciando a partida!`);

        this.#agentes.forEach(agente => {
            agente.entrarEmCombate(); // Polimorfismo
        });
    }

    // Usa filter com instanceof para retornar só os Controladores
    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}

// ----- Main -----

// Dois controladores, um iniciador e um duelista
const controladorOmen = new Controlador('Omen', 'Ghost');
const controladorBrimstone = new Controlador('Brimstone', 'Sheriff');
const iniciadorSova = new Iniciador('Sova', 'Classic');
const duelistaJett = new Duelista('Jett', 'Frenzy');

// Reúne os quatro agentes em um esquadrão
const esquadraoAlpha = new Esquadrao('Alpha', [
    controladorOmen,
    controladorBrimstone,
    iniciadorSova,
    duelistaJett
]);

esquadraoAlpha.iniciarPartida();

console.log('Controladores do esquadrão:');

// Imprime o codinome de cada controlador retornado
esquadraoAlpha.listarControladores().forEach(controlador => {
    console.log(controlador.codinome);
});

// O objeto base é criado normalmente (o erro só acontece ao chamar o método)
const agenteBase = new AgenteProtocolo('AgenteBase', 'Classic');

// Esta chamada gera erro, pois usarHabilidade() não foi implementado na classe base.
// Por isso ela fica comentada para o programa continuar rodando:
// agenteBase.entrarEmCombate();
