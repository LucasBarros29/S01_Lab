class Persona:

    def __init__(self, nome_persona: str, tipo_arcano: str):
        self.nome = nome_persona
        self.arcano = tipo_arcano  # representa a classificação da Persona

    def chamar_persona(self):
        print(f"Persona! {self.nome}, do arcano {self.arcano}, foi invocada!")


class Aliado:

    def __init__(self, nome_completo: str, apelido: str):
        self.nome = nome_completo
        self.codinome = apelido


class Lider:

    def __init__(self, nome_lider: str):
        self.codinome = nome_lider

        # cria uma Persona pertencente ao líder
        self.companheira = Persona("Arsène", "Louco")

        # armazena as referências dos aliados recrutados
        self.grupo = []

    def adicionar_aliado(self, integrante: Aliado):
        self.grupo.append(integrante)
        print(f"{integrante.nome} entrou para os Phantom Thieves com o codinome {integrante.codinome}.")

    def invadir_palacio(self, nome_palacio: str):
        print(f"\n--- {self.codinome} invade o Palácio de {nome_palacio} ---")
        self.companheira.chamar_persona()

        print(f"Equipe ({len(self.grupo)} aliados):")
        for integrante in self.grupo:
            print(f"- {integrante.codinome} ({integrante.nome})")


if __name__ == "__main__":
    print("--- Phantom Thieves ---")

    # instancia os aliados antes de criar o líder
    aliado_um = Aliado("Ryuji Sakamoto", "Skull")
    aliado_dois = Aliado("Ann Takamaki", "Panther")

    # o líder é criado com sua própria Persona
    protagonista = Lider("Joker")
    protagonista.adicionar_aliado(aliado_um)
    protagonista.adicionar_aliado(aliado_dois)

    protagonista.invadir_palacio("Kamoshida")

    # demonstra que o aliado pode ser utilizado fora da equipe
    print(f"\nFora do Palácio, {aliado_um.codinome} volta a ser só {aliado_um.nome}.")
