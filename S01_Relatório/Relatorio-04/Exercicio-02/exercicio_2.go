package main

import "fmt"

func main() {
	var vendasQ1, vendasQ2, vendasQ3 int

	fmt.Print("Digite as vendas do 1o trimestre: ")
	fmt.Scanln(&vendasQ1)

	fmt.Print("Digite as vendas do 2o trimestre: ")
	fmt.Scanln(&vendasQ2)

	fmt.Print("Digite as vendas do 3o trimestre: ")
	fmt.Scanln(&vendasQ3)

	somaVendas := vendasQ1 + vendasQ2 + vendasQ3

	if somaVendas < 100 {
		fmt.Println("Meta minima anual nao atingida!")
	} else {
		fmt.Println("Total de vendas:", somaVendas, "unidades")

		// Avalia a categoria de acordo com o total acumulado de vendas
		switch {
		case somaVendas >= 250:
			fmt.Println("Classificacao: Categoria Top Seller")
		case somaVendas >= 180:
			fmt.Println("Classificacao: Categoria Senior")
		default:
			fmt.Println("Classificacao: Categoria Pleno")
		}
	}
}
