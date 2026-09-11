package main

import "fmt"

func conferirAcesso(area string, numeroIngresso int) bool {
	if area == "VIP" && numeroIngresso == 2026 {
		return true
	}
	return false
}

func main() {
	var areaEvento string
	var codigoAcesso int

	// Repete a validação até que um ingresso válido seja informado
	for {
		fmt.Print("Digite o setor do ingresso: ")

		_, erroArea := fmt.Scanln(&areaEvento)

		// Caso ocorra erro na leitura, o programa é finalizado
		if erroArea != nil {
			fmt.Println()
			fmt.Println("Entrada encerrada.")
			break
		}

		fmt.Print("Digite o codigo do ingresso: ")

		_, erroCodigo := fmt.Scanln(&codigoAcesso)

		// Verifica se o código foi informado corretamente
		if erroCodigo != nil {
			fmt.Println()
			fmt.Println("Entrada encerrada.")
			break
		}

		if conferirAcesso(areaEvento, codigoAcesso) {
			fmt.Println("Acesso liberado a area VIP!")
			break
		} else {
			fmt.Println("Ingresso ou setor invalido. Tente novamente.")
		}
	}
}
