using System;
using System.Collections.Generic;

// Exercício 4: Revisão dos conceitos de herança, composição, agregação e polimorfismo

// CLASSE PRINCIPAL: representa uma entidade que pode ser registrada no catálogo
public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    // Inicializa a entidade e informa que ela foi registrada.
    public EntidadeCosmica(string nomeEntidade)
    {
        this.Nome = nomeEntidade;
        Console.WriteLine($"[Registro] Entidade arquivada na Miskatonic: {Nome}");
    }

    // Método que pode ser personalizado pelas classes derivadas.
    public virtual void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine("Uma presença indescritível se manifesta...");

        // Mostra a origem somente quando ela tiver sido informada.
        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

// HERANÇA: um Profundo também é considerado uma EntidadeCosmica.
public class Profundo : EntidadeCosmica
{
    public int Profundidade { get; private set; }

    // Define o nome da entidade e a profundidade em que ela se encontra.
    public Profundo(string nomeEntidade, int nivelProfundidade) : base(nomeEntidade)
    {
        this.Profundidade = nivelProfundidade;
    }

    // Apresenta uma manifestação específica para esse tipo de entidade.
    public override void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"Emerge das águas escuras a {Profundidade} metros de profundidade, perto de Innsmouth.");
    }
}

// HERANÇA: um MiGo também pertence à categoria EntidadeCosmica.
public class MiGo : EntidadeCosmica
{
    public string Artefato { get; set; }

    // Cria o MiGo informando seu nome e o artefato que ele carrega.
    public MiGo(string nomeEntidade, string objetoArtefato) : base(nomeEntidade)
    {
        this.Artefato = objetoArtefato;
    }

    // Executa primeiro a manifestação padrão e depois adiciona sua própria informação.
    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"Carrega consigo um artefato: {Artefato}.");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }

    // Guarda as entidades que foram adicionadas ao catálogo do pesquisador.
    private List<EntidadeCosmica> registrosCatalogados;

    public Pesquisador(string nomePesquisador)
    {
        this.Nome = nomePesquisador;
        this.registrosCatalogados = new List<EntidadeCosmica>();
    }

    // Recebe uma entidade existente e adiciona sua referência ao catálogo.
    public void Catalogar(EntidadeCosmica entidadeEncontrada)
    {
        this.registrosCatalogados.Add(entidadeEncontrada);
        Console.WriteLine($"{Nome} catalogou o relato: {entidadeEncontrada.Nome}");
    }

    // Percorre os registros e chama o comportamento correspondente de cada entidade.
    public void LerCatalogo()
    {
        Console.WriteLine($"\n{Nome} abre o catálogo com {registrosCatalogados.Count} relatos:");

        foreach (var registroAtual in registrosCatalogados)
        {
            registroAtual.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] parametros)
    {
        Console.WriteLine("=== Arquivos Proibidos da Miskatonic ===");

        // Cria uma entidade do tipo Profundo.
        Profundo criaturaMarinha = new Profundo("Profundo de Y'ha-nthlei", 1200);

        // Cria um MiGo e define sua origem.
        MiGo criaturaMiGo = new MiGo("Mi-Go", "Cilindro cerebral");
        criaturaMiGo.Origem = "Yuggoth";

        // A classe base também pode ser criada diretamente.
        EntidadeCosmica entidadeDesconhecida = new EntidadeCosmica("A Cor que Caiu do Espaço");

        // Cria o pesquisador responsável pelos registros.
        Pesquisador pesquisadorPrincipal = new Pesquisador("Henry Armitage");

        // Adiciona as entidades ao catálogo.
        pesquisadorPrincipal.Catalogar(criaturaMarinha);
        pesquisadorPrincipal.Catalogar(criaturaMiGo);
        pesquisadorPrincipal.Catalogar(entidadeDesconhecida);

        // Realiza a leitura dos registros catalogados.
        pesquisadorPrincipal.LerCatalogo();

        Console.WriteLine("\n=== Fim dos Arquivos ===");
    }
}
