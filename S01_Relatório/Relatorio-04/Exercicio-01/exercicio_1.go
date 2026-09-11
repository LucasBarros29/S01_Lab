package main

import "fmt"

// Verifica se o código possui a quantidade correta de caracteres
func VerificarRastreio(codRastreio string) (bool, string) {
	if len(codRastreio) == 10 {
		return true, "Código de rastreio cadastrado com sucesso!"
	}
	return false, "Erro: o código de rastreio precisa conter exatamente 10 caracteres."
}

func main() {
	var rastreio string

	// Laço de repetição executado até que um código válido seja informado
	for {
		fmt.Print("Informe o código de rastreio: ")

		_, erroLeitura := fmt.Scanln(&rastreio)

		// Caso a leitura da entrada falhe, o programa é encerrado
		if erroLeitura != nil {
			fmt.Println()
			fmt.Println("Leitura finalizada.")
			break
		}

		estaValido, retorno := VerificarRastreio(rastreio)

		fmt.Println(retorno)

		if estaValido {
			break
		}
	}
}
