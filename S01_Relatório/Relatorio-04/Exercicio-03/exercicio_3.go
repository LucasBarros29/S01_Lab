package main

import "fmt"

func criarEscalaTecnicos(totalPlantoes int) {
	fmt.Println("--- Escala de Plantao Tecnico ---")

	// Percorre a quantidade de plantões informada e calcula os dias da escala
	for indice := 0; indice < totalPlantoes; indice++ {
		diaPlantao := 1 + indice*4
		fmt.Printf("Plantao %d: Dia %d do mes\n", indice+1, diaPlantao)
	}
}

func main() {
	var numeroPlantoes int

	fmt.Print("Digite a quantidade de plantoes necessarios: ")
	fmt.Scanln(&numeroPlantoes)

	// Chama a função responsável por exibir a escala de plantões
	criarEscalaTecnicos(numeroPlantoes)
}
