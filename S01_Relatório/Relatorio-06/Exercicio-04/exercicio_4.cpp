#include <iostream>
#include <string>
#include <vector>

using namespace std;

// Classe base
class Hobbit {
protected:
    string nome;

public:
    Hobbit(string nome) {
        this->nome = nome;
    }

    virtual void fazerAtividade() {
        cout << "O hobbit " << nome
             << " está aproveitando um dia tranquilo na Comarca." << endl;
    }

    virtual ~Hobbit() {}
};

// Classe Jardineiro
class Jardineiro : public Hobbit {
public:
    Jardineiro(string nome) : Hobbit(nome) {}

    void fazerAtividade() override {
        cout << "O jardineiro " << nome
             << " está cuidando das flores e plantas ao redor das tocas!" << endl;
    }
};

// Classe Cozinheiro
class Cozinheiro : public Hobbit {
public:
    Cozinheiro(string nome) : Hobbit(nome) {}

    void fazerAtividade() override {
        cout << "O cozinheiro " << nome
             << " está preparando o segundo café da manhã para os convidados!" << endl;
    }
};

// Classe Fazendeiro
class Fazendeiro : public Hobbit {
public:
    Fazendeiro(string nome) : Hobbit(nome) {}

    void fazerAtividade() override {
        cout << "O fazendeiro " << nome
             << " está colhendo vegetais e hortaliças em suas terras!" << endl;
    }
};

int main() {

    // Vetor de ponteiros para a classe base
    vector<Hobbit*> hobbits;

    // Criando os objetos
    Jardineiro jardineiro("Sam");
    Cozinheiro cozinheiro("Bilbo");
    Fazendeiro fazendeiro("Frodo");

    // Adicionando ao vetor
    hobbits.push_back(&jardineiro);
    hobbits.push_back(&cozinheiro);
    hobbits.push_back(&fazendeiro);

    // Percorrendo o vetor
    for (Hobbit* hobbit : hobbits) {
        hobbit->fazerAtividade();
    }

    return 0;
}
