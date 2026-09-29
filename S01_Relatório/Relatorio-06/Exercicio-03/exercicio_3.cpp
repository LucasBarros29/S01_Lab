#include <iostream>
#include <string>

using namespace std;

// Classe base
class MembroInatel {
protected:
    string nome;

public:
    void setNome(string nome) {
        this->nome = nome;
    }

    string getNome() {
        return nome;
    }

    virtual void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: "
             << nome << "." << endl;
    }
};

// Classe Aluno herdando de MembroInatel
class Aluno : public MembroInatel {
private:
    string curso;

public:
    void setCurso(string curso) {
        this->curso = curso;
    }

    string getCurso() {
        return curso;
    }

    // Sobrescrevendo o método
    void seApresentar() override {
        cout << "Meu nome é " << nome
             << " e estudo no curso de " << curso << "." << endl;
    }
};

// Classe Professor herdando de MembroInatel
class Professor : public MembroInatel {
private:
    string disciplina;

public:
    void setDisciplina(string disciplina) {
        this->disciplina = disciplina;
    }

    string getDisciplina() {
        return disciplina;
    }

    // Sobrescrevendo o método
    void seApresentar() override {
        cout << "Meu nome é " << nome
             << " e leciono a disciplina de "
             << disciplina << "." << endl;
    }
};

int main() {

    // Criando um objeto Aluno
    Aluno aluno;

    aluno.setNome("Joao");
    aluno.setCurso("Engenharia de Computacao");

    // Criando um objeto Professor
    Professor professor;

    professor.setNome("Carlos");
    professor.setDisciplina("Programacao Orientada a Objetos");

    // Chamando os métodos sobrescritos
    aluno.seApresentar();
    professor.seApresentar();

    return 0;
}
