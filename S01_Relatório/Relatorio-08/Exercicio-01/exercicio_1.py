class MortoVivo:

    def __init__(self, personagem: str, total_almas: int, frascos: int):
        # atributos com diferentes níveis de acesso
        self.nome = personagem
        self._quantidade_almas = total_almas
        self.__quantidade_estus = frascos

    # métodos para consultar e modificar os frascos
    def consultar_estus(self):
        return self.__quantidade_estus

    def alterar_estus(self, novo_total: int):
        # permite valores entre zero e dez
        if 0 <= novo_total <= 10:
            self.__quantidade_estus = novo_total
        else:
            print("Quantidade de Estus inválida!")

    # monta e devolve as informações do personagem
    def exibir_informacoes(self):
        return f"Morto-vivo {self.nome} | Almas: {self._quantidade_almas} | Estus: {self.__quantidade_estus}"


# HERANÇA
# o clérigo herda as características de MortoVivo
class Clerigo(MortoVivo):

    def __init__(self, personagem: str, total_almas: int, frascos: int, habilidade: str):
        # inicializa os atributos herdados da classe principal
        super().__init__(personagem, total_almas, frascos)
        self.milagre = habilidade

    # SOBRESCRITA DE MÉTODO
    # adiciona a habilidade especial ao status herdado
    def exibir_informacoes(self):
        return super().exibir_informacoes() + f" | Milagre: {self.milagre}"


if __name__ == "__main__":
    print("--- A Fogueira de Firelink ---")

    personagem = Clerigo("Petrus", 2000, 5, "Cura")
    print(personagem.exibir_informacoes())

    print("\n--- Descansando na fogueira ---")
    personagem.alterar_estus(15)  # valor inválido, não modifica os frascos
    personagem.alterar_estus(10)  # valor válido, atualiza a quantidade
    print(personagem.exibir_informacoes())

    # Acesso direto ao atributo privado não é permitido desta forma:
    # print(personagem.__quantidade_estus)
    # O Python modifica internamente o nome do atributo privado.
    # Por isso, utilizamos um método público para consultar seu valor.
    print(f"\nEstus via getter: {personagem.consultar_estus()}")
