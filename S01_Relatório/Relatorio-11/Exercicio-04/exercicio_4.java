// Atividade 4: Revisão Geral (O Festim da Masmorra)
//
// Composição: o objeto Panela nasce dentro do construtor do Cozinheiro e depende dele para existir.
// Agregação: os monstros são criados separadamente, antes do Cozinheiro, e ele apenas os guarda numa lista.

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        System.out.println("--- O Banquete da Masmorra ---");

        // os monstros são criados primeiro, de forma independente do cozinheiro
        Slime gosma = new Slime("Slime gigante");
        Mandragora raiz = new Mandragora("Mandrágora");

        // o cozinheiro recebe os monstros já prontos como ingredientes
        Cozinheiro chef = new Cozinheiro("Senshi", "adamantite");
        chef.adicionarIngrediente(gosma);
        chef.adicionarIngrediente(raiz);

        chef.servirBanquete();
    }
}


// Classe abstrata: define o que todo monstro tem, mas cada tipo cria a própria receita
abstract class Monstro {
    private String identificacao;

    public Monstro(String identificacao) {
        this.identificacao = identificacao;
    }

    public String getNome() {
        return identificacao;
    }

    // cada subclasse precisa informar como o monstro é preparado
    public abstract String receita();
}


// Slime é um tipo de Monstro, com preparo próprio
class Slime extends Monstro {
    public Slime(String identificacao) {
        super(identificacao);
    }

    @Override
    public String receita() {
        return "seco ao sol e servido como gelatina";
    }
}


// Mandrágora também é um Monstro, mas com outra receita
class Mandragora extends Monstro {
    public Mandragora(String identificacao) {
        super(identificacao);
    }

    @Override
    public String receita() {
        return "picada e frita em uma omelete";
    }
}


// Parte da composição: a panela só existe dentro do cozinheiro
class Panela {
    private String tipoMaterial;

    public Panela(String tipoMaterial) {
        this.tipoMaterial = tipoMaterial;
    }

    public String getMaterial() {
        return tipoMaterial;
    }
}


// Cozinheiro tem uma panela (composição) e uma lista de monstros (agregação)
class Cozinheiro {
    private String apelido;
    private Panela utensilio;
    private ArrayList<Monstro> listaMonstros;

    public Cozinheiro(String apelido, String materialDaPanela) {
        this.apelido = apelido;
        this.utensilio = new Panela(materialDaPanela);    // composição: a panela é criada aqui dentro
        this.listaMonstros = new ArrayList<>();
    }

    // agregação: aceita um monstro que já foi criado fora da classe
    public void adicionarIngrediente(Monstro criatura) {
        listaMonstros.add(criatura);
    }

    public void servirBanquete() {
        System.out.println(apelido + " serve o banquete na panela de " + utensilio.getMaterial() + ":");
        // percorre a lista e mostra a receita de cada monstro
        for (Monstro criatura : listaMonstros) {
            System.out.println("- " + criatura.getNome() + ": " + criatura.receita());
        }
    }
}
