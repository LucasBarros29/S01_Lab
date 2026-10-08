using System;
using System.Collections.Generic;

// Exercício 1: Controle de acesso e inicialização dos combatentes de Gondor

public class CombatenteDeGondor
{
    // Os dados podem ser consultados externamente,
    // porém suas alterações ficam restritas à própria classe.
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public int Circulo { get; private set; }

    // Todo combatente inicia sem nenhuma arma equipada.
    public string Armamento { get; private set; } = "Desarmado";

    // Recebe as informações do combatente no momento da criação.
    public CombatenteDeGondor(string nomeCombatente, string origem, string funcao, int numeroCirculo)
    {
        this.Nome = nomeCombatente;
        this.Povo = origem;
        this.Posto = funcao;
        this.Circulo = numeroCirculo;

        Console.WriteLine($"[Convocação] {Nome} ({Povo}) foi convocado para defender o Círculo {Circulo} de Minas Tirith.");
    }

    // Define qual equipamento será utilizado pelo combatente.
    public void Equipar(string equipamento)
    {
        this.Armamento = equipamento;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");
        Console.WriteLine($"Círculo: {Circulo}");

        // Mostra a arma somente quando existe algum equipamento definido.
        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] argumentos)
    {
        Console.WriteLine("=== Cerco a Minas Tirith ===");

        CombatenteDeGondor guerreiroElfo = new CombatenteDeGondor("Legolas", "Elfo", "Arqueiro", 1);
        guerreiroElfo.Equipar("Arco dos Galadhrim");

        CombatenteDeGondor guardaHobbit = new CombatenteDeGondor("Peregrin Took", "Hobbit", "Guarda da Cidadela", 7);

        CombatenteDeGondor guerreiroAnao = new CombatenteDeGondor("Gimli", "Anão", "Guerreiro", 2);
        guerreiroAnao.Equipar("Machado de Batalha");

        guerreiroElfo.ApresentarUnidade();
        guardaHobbit.ApresentarUnidade();
        guerreiroAnao.ApresentarUnidade();

        // Esta alteração direta não é permitida fora da classe,
        // pois a propriedade Posto possui um modificador private no set.
        // guardaHobbit.Posto = "Capitão de Gondor";
        // error CS0272: The property or indexer 'CombatenteDeGondor.Posto' cannot be used
        // in this context because the set accessor is inaccessible
        // Isso demonstra que somente a classe CombatenteDeGondor consegue modificar o Posto.

        Console.WriteLine("\n=== Fim da Convocação ===");
    }
}
