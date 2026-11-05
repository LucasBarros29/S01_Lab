// Atividade 2: Herança, Sobrescrita de Método e ArrayList (Menu do Leblanc)

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        System.out.println("--- Cardápio do Leblanc ---");

        // criando os itens que vão aparecer no menu
        ItemDoCardapio bebida = new ItemDoCardapio("Café coado", 8.0);
        ItemDoCardapio prato = new ItemDoCardapio("Curry da casa", 22.0);
        ComboLeblanc promocao = new ComboLeblanc("Combo curry + café", 30.0);

        // o café guarda todos os itens numa lista
        CafeLeblanc lanchonete = new CafeLeblanc();
        lanchonete.adicionar(bebida);
        lanchonete.adicionar(prato);
        lanchonete.adicionar(promocao);

        lanchonete.mostrarCardapio();
    }
}


// Representa um produto qualquer vendido no café
class ItemDoCardapio {
    private String titulo;
    private double valor;

    public ItemDoCardapio(String titulo, double valor) {
        this.titulo = titulo;
        this.valor = valor;
    }

    public String getNome() {
        return titulo;
    }

    public double getPreco() {
        return valor;
    }

    // para itens comuns, o preço final é o próprio valor cadastrado
    public double precoFinal() {
        return valor;
    }
}


// ComboLeblanc é um tipo especial de ItemDoCardapio (herança)
class ComboLeblanc extends ItemDoCardapio {
    public ComboLeblanc(String titulo, double valor) {
        super(titulo, valor);
    }

    // sobrescreve o método da classe pai: aplica 10% de desconto no combo
    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}


// Guarda e exibe a lista de itens do café
class CafeLeblanc {
    private ArrayList<ItemDoCardapio> listaItens;

    public CafeLeblanc() {
        this.listaItens = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio produto) {
        listaItens.add(produto);
    }

    public void mostrarCardapio() {
        // percorre a lista e usa o precoFinal() de cada item
        // (o combo usa a versão com desconto)
        for (ItemDoCardapio produto : listaItens) {
            System.out.println(produto.getNome() + " - R$ " + produto.precoFinal());
        }
    }
}
