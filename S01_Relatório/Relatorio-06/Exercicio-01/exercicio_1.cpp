#include <iostream>
#include <string>

using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival) {
        cout << nome << " esta duelando contra "
             << rival.nome << "!" << endl;

        rival.energia -= potenciaSom;
    }

    void exibirStatus() {
        cout << "\nNome: " << nome << endl;
        cout << "Integrantes: " << integrantes << endl;
        cout << "Potencia do som: " << potenciaSom << endl;
        cout << "Energia: " << energia << endl;
    }
};

int main() {
    Banda banda1;
    Banda banda2;

    banda1.nome = "Banda A";
    banda1.integrantes = 5;
    banda1.potenciaSom = 30.0;
    banda1.energia = 100;

    banda2.nome = "Banda B";
    banda2.integrantes = 4;
    banda2.potenciaSom = 20.0;
    banda2.energia = 100;

    cout << "STATUS INICIAL\n";

    banda1.exibirStatus();
    banda2.exibirStatus();

    banda1.duelar(banda2);

    cout << "\nSTATUS APOS O DUELO\n";

    banda1.exibirStatus();
    banda2.exibirStatus();

    return 0;
}
