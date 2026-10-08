using System;
using System.Collections.Generic;

// Exercício 3: Composição e agregação utilizando uma maga, seu grimório e seus companheiros
//
// COMPOSIÇÃO:
// - A maga possui um grimório que é criado durante sua própria criação.
// - Os feitiços são criados diretamente dentro do grimório.
// - Dessa forma, esses objetos dependem do objeto principal para serem criados.
//
// AGREGAÇÃO:
// - Os companheiros são criados separadamente da maga.
// - Depois de criados, eles apenas são adicionados ao grupo da maga.
// - Eles continuam existindo mesmo sem a presença da maga.

public class Feitico
{
    public string Nome { get; set; }

    // Recebe o nome do feitiço no momento de sua criação.
    public Feitico(string nomeFeitico)
    {
        this.Nome = nomeFeitico;
    }

    // Exibe a ação realizada pelo feitiço.
    public void Conjurar()
    {
        Console.WriteLine($"Conjurando: {Nome}!");
    }
}

public class Grimorio
{
    // Armazena todos os feitiços pertencentes ao grimório.
    private List<Feitico> listaFeiticos;

    public Grimorio()
    {
        this.listaFeiticos = new List<Feitico>();
    }

    // Cria um novo feitiço e adiciona ele ao grimório.
    public void Registrar(string nomeMagia)
    {
        this.listaFeiticos.Add(new Feitico(nomeMagia));
        Console.WriteLine($"[Grimório] Novo feitiço registrado: {nomeMagia}");
    }

    public void ListarFeiticos()
    {
        Console.WriteLine($"\nO grimório tem {listaFeiticos.Count} feitiços:");

        // Percorre todos os feitiços cadastrados no grimório.
        foreach (var magiaAtual in listaFeiticos)
        {
            magiaAtual.Conjurar();
        }
    }
}

public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    // Cria um companheiro que possui existência independente da maga.
    public Companheiro(string nomeCompanheiro, string ocupacao)
    {
        this.Nome = nomeCompanheiro;
        this.Funcao = ocupacao;

        Console.WriteLine($"[Companheiro] {Nome} ({Funcao}) já existe por conta própria.");
    }

    // Mostra as informações do companheiro.
    public void Apresentar()
    {
        Console.WriteLine($"Eu sou {Nome}, {Funcao}.");
    }
}

public class Maga
{
    public string Nome { get; set; }

    // O grimório só pode ser substituído pela própria classe Maga.
    public Grimorio Grimorio { get; private set; }

    // Guarda os companheiros que fazem parte do grupo.
    private List<Companheiro> grupoCompanheiros;

    public Maga(string nomeMaga)
    {
        this.Nome = nomeMaga;

        // O grimório é criado junto com a maga.
        this.Grimorio = new Grimorio();

        this.grupoCompanheiros = new List<Companheiro>();

        Console.WriteLine($"\n[Maga] {Nome} iniciou a jornada carregando o seu grimório.");
    }

    // Recebe um companheiro já existente e adiciona ele ao grupo.
    public void RecrutarCompanheiro(Companheiro novoCompanheiro)
    {
        this.grupoCompanheiros.Add(novoCompanheiro);
        Console.WriteLine($"{novoCompanheiro.Nome} entrou para o grupo de {Nome}.");
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\nGrupo de {Nome} ({grupoCompanheiros.Count} companheiros):");

        // Exibe cada integrante que foi adicionado ao grupo.
        foreach (var integrante in grupoCompanheiros)
        {
            integrante.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] argumentos)
    {
        Console.WriteLine("=== A Jornada de Frieren ===");

        // Os companheiros são criados separadamente antes da criação da maga.
        Companheiro magaAprendiz = new Companheiro("Fern", "Maga Aprendiz");
        Companheiro guerreiro = new Companheiro("Stark", "Guerreiro");

        // A criação da maga também cria seu próprio grimório.
        Maga magaPrincipal = new Maga("Frieren");

        magaPrincipal.RecrutarCompanheiro(magaAprendiz);
        magaPrincipal.RecrutarCompanheiro(guerreiro);

        // Os feitiços são cadastrados diretamente no grimório da maga.
        magaPrincipal.Grimorio.Registrar("Zoltraak");
        magaPrincipal.Grimorio.Registrar("Campo de Flores");
        magaPrincipal.Grimorio.Registrar("Limpar Estátuas de Bronze");

        magaPrincipal.MostrarGrupo();
        magaPrincipal.Grimorio.ListarFeiticos();

        // O companheiro continua independente e pode ser utilizado diretamente.
        Console.WriteLine("\n--- Stark se apresenta sozinho ---");
        guerreiro.Apresentar();

        Console.WriteLine("\n=== Fim da Jornada ===");
    }
}
