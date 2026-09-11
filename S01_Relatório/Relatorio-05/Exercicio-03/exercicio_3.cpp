#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    float capacidadeMaxima, cargaAtual = 0.0f;
    int opcao;

    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidadeMaxima;

    do {
        cout << "\n=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1: {
                cout << fixed << setprecision(2);
                cout << "Carga Atual: " << cargaAtual << " kg / " << capacidadeMaxima << " kg" << endl;
                cout << "Espaco Disponivel: " << (capacidadeMaxima - cargaAtual) << " kg" << endl;
              
                break;
            }

            case 2: {
                float pesoPacote;

                cout << "Digite o peso do pacote a ser carregado (kg): ";
                cin >> pesoPacote;

                if (cargaAtual + pesoPacote <= capacidadeMaxima) {
                    cargaAtual += pesoPacote;
                    cout << "Pacote adicionado com sucesso!" << endl;
                } else {
                    cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
                }
                break;
            }

            case 3: {
                float pesoRemover;

                cout << "Digite o peso a ser removido (kg): ";
                cin >> pesoRemover;

                if (pesoRemover <= cargaAtual) {
                    cargaAtual -= pesoRemover;
                    cout << "Pacote removido com sucesso!" << endl;
                } else {
                    cout << "Erro: Nao e permitido remover mais peso do que o carregado." << endl;
                }
                break;
            }

            case 4:
                cout << "Encerrando sistema de telemetria..." << endl;
                break;

            default:
                cout << "Opcao invalida!" << endl;
        }

    } while (opcao != 4);

    return 0;
}
