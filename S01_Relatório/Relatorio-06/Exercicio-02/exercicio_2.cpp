#include <iostream>
#include <string>

using namespace std;

class LinkSocial {
private:
    string nome;
    string arcana;
    int rank;

public:
    // Getters
    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    // Setters
    void setNome(string nome) {
        this->nome = nome;
    }

    void setArcana(string arcana) {
        this->arcana = arcana;
    }

    void setRank(int rank) {
        this->rank = rank;
    }

    // Aumenta o rank em 1
    void subirRank() {
        rank++;
    }
};

int main() {
    // Criando um objeto
    LinkSocial link;

    // Definindo os valores usando setters
    link.setNome("Yusuke");
    link.setArcana("Imperador");
    link.setRank(1);

    // Mostrando o rank antes
    cout << "Rank inicial: " << link.getRank() << endl;

    // Aumentando o rank
    link.subirRank();

    // Mostrando os dados usando getters
    cout << "\n--- Link Social ---" << endl;
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;

    return 0;
}
