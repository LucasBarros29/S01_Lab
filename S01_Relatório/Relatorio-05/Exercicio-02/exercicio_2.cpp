#include <iostream>
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {
    float confiabilidade = 1.0;

    for (int i = 0; i < tamanho; i++) {
        confiabilidade *= probabilidades[i];
    }

    return confiabilidade;
}

int main() {
    int N;

    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> N;

    float probabilidades[N];

    for (int i = 0; i < N; i++) {
        cout << "Digite a probabilidade do componente " << i + 1 << " (ex: 0.95): ";
        cin >> probabilidades[i];
    }

    float confiabilidade =
        calcular_confiabilidade_sistema(probabilidades, N);

    cout << "Confiabilidade total do sistema: " << confiabilidade;
    cout << " (" << confiabilidade * 100 << "%)" << endl;

    return 0;
}
