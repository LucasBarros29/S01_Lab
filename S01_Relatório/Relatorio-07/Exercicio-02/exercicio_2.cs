using System;
using System.Collections.Generic;

// Exercício 2: Utilização de herança e polimorfismo com Pokémon

// CLASSE PRINCIPAL: representa as características básicas de qualquer Pokémon
public class Pokemon
{
    public string Especie { get; set; }
    public int Nivel { get; private set; }

    // Inicializa um Pokémon com sua espécie e seu nível.
    public Pokemon(string nomeEspecie, int nivelPokemon)
    {
        this.Especie = nomeEspecie;
        this.Nivel = nivelPokemon;
    }

    // Permite que as classes derivadas possam modificar esse comportamento.
    public virtual void EntrarEmCampo()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) entrou em campo! ---");
        Console.WriteLine($"{Especie} usou Investida!");
    }
}

// HERANÇA: essa classe representa um Pokémon do tipo Planta.
public class TipoPlanta : Pokemon
{
    public string GolpeEspecial { get; set; }

    // Utiliza o construtor da classe principal para definir espécie e nível.
    public TipoPlanta(string nomeEspecie, int nivelPokemon, string ataqueEspecial) : base(nomeEspecie, nivelPokemon)
    {
        this.GolpeEspecial = ataqueEspecial;
    }

    // Substitui o comportamento original pelo ataque específico do tipo Planta.
    public override void EntrarEmCampo()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) entrou em campo! ---");
        Console.WriteLine($"{Especie} usou {GolpeEspecial}! Um golpe especial do Tipo Planta!");
    }
}

// HERANÇA: essa classe representa um Pokémon do tipo Elétrico.
public class TipoEletrico : Pokemon
{
    public int Voltagem { get; private set; }

    // Cria um Pokémon elétrico e também registra sua potência elétrica.
    public TipoEletrico(string nomeEspecie, int nivelPokemon, int potenciaVoltagem) : base(nomeEspecie, nivelPokemon)
    {
        this.Voltagem = potenciaVoltagem;
    }

    // Mantém o comportamento original e adiciona uma ação específica do tipo Elétrico.
    public override void EntrarEmCampo()
    {
        base.EntrarEmCampo();
        Console.WriteLine($"{Especie} soltou uma descarga elétrica de {Voltagem} volts!");
    }
}

public class Program
{
    public static void Main(string[] argumentos)
    {
        Console.WriteLine("=== Batalha de Exibição Pokémon ===");

        // A coleção utiliza a classe principal e pode armazenar diferentes tipos de Pokémon.
        List<Pokemon> listaPokemons = new List<Pokemon>();
        listaPokemons.Add(new TipoPlanta("Sceptile", 36, "Leaf Blade"));
        listaPokemons.Add(new TipoEletrico("Jolteon", 30, 10000));
        listaPokemons.Add(new Pokemon("Eevee", 15));

        Console.WriteLine($"Pokémon em campo: {listaPokemons.Count}");

        // POLIMORFISMO: cada objeto chama a implementação correspondente ao seu próprio tipo.
        foreach (var pokemonAtual in listaPokemons)
        {
            pokemonAtual.EntrarEmCampo();
        }

        Console.WriteLine("\n=== Fim da Batalha ===");
    }
}
