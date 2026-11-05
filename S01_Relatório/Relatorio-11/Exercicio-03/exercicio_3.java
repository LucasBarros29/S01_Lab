// Atividade 3: Interface e HashMap (Registro de Aparições na Cidade)

import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        System.out.println("--- Mapa de Avistamentos ---");

        // criando as duas criaturas que serão registradas
        Alienigena visitante = new Alienigena("Serpoiano");
        EspiritoYoukai fantasma = new EspiritoYoukai("Vovó Turbo");

        // guardando cada criatura no local onde ela aparece
        MapaDeAvistamentos registro = new MapaDeAvistamentos();
        registro.registrar("Hospital abandonado", visitante);
        registro.registrar("Túnel", fantasma);

        registro.investigar("Hospital abandonado");
        registro.investigar("Túnel");
        registro.investigar("Escola");    // esse lugar não foi cadastrado
    }
}


// Contrato comum: qualquer criatura sobrenatural precisa saber se manifestar
interface Sobrenatural {
    void manifestar();
}


// Alienígena cumpre o contrato da interface Sobrenatural
class Alienigena implements Sobrenatural {
    private String apelido;

    public Alienigena(String apelido) {
        this.apelido = apelido;
    }

    @Override
    public void manifestar() {
        System.out.println(apelido + " desce de um disco voador e tenta abduzir quem está investigando!");
    }
}


// Espírito youkai também implementa a interface, com sua própria manifestação
class EspiritoYoukai implements Sobrenatural {
    private String apelido;

    public EspiritoYoukai(String apelido) {
        this.apelido = apelido;
    }

    @Override
    public void manifestar() {
        System.out.println(apelido + " aparece do nada e persegue quem está investigando!");
    }
}


// Associa cada local a uma criatura e permite investigar os lugares
class MapaDeAvistamentos {
    // a chave do mapa é o nome do local
    private HashMap<String, Sobrenatural> registros;

    public MapaDeAvistamentos() {
        this.registros = new HashMap<>();
    }

    public void registrar(String lugar, Sobrenatural criatura) {
        registros.put(lugar, criatura);
    }

    public void investigar(String lugar) {
        System.out.println("--- Investigando: " + lugar + " ---");
        Sobrenatural encontrada = registros.get(lugar);

        // se o lugar não existe no mapa, o get retorna null
        if (encontrada == null) {
            System.out.println("O local está tranquilo.");
        } else {
            encontrada.manifestar();
        }
    }
}
