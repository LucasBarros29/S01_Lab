// Atividade 1: Classe Abstrata e Herança (Habitantes do Castelo)

public class Main {
    public static void main(String[] args) {
        System.out.println("--- Os Moradores do Castelo ---");

        // ambos os objetos são referenciados pelo tipo base Morador
        Morador personagem1 = new Mago("Howl", "virar um pássaro gigante");
        Morador personagem2 = new DemonioDoFogo("Calcifer");

        personagem1.apresentar();
        personagem2.apresentar();

        // Não compila, pois Morador é abstrata e não permite criar objetos:
        // Morador sophie = new Morador("Sophie");
        // error: Morador is abstract; cannot be instantiated
    }
}


// Classe abstrata: serve apenas de base, sem criar objetos diretamente
abstract class Morador {
    private String nomeMorador;

    public Morador(String nomeMorador) {
        this.nomeMorador = nomeMorador;
    }

    public String getNome() {
        return nomeMorador;
    }

    // Método sem corpo: cada subclasse precisa fornecer sua própria versão
    public abstract void apresentar();
}


// Mago é um tipo de Morador (herança)
class Mago extends Morador {
    private String magia;

    public Mago(String nomeMorador, String magia) {
        super(nomeMorador);
        this.magia = magia;
    }

    @Override
    public void apresentar() {
        System.out.println("Sou o mago " + getNome() + " e meu feitiço é " + magia + ".");
    }
}


// DemonioDoFogo também herda de Morador
class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nomeMorador) {
        super(nomeMorador);
    }

    @Override
    public void apresentar() {
        System.out.println("Sou " + getNome() + ", o demônio do fogo, e faço o castelo andar!");
    }
}
