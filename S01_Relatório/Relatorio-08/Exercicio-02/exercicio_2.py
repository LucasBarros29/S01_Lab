class HeroiOverwatch:

    def __init__(self, nome_heroi: str, tipo: str):
        self.codinome = nome_heroi
        self.funcao = tipo

    def ativar_suprema(self):
        print(f"{self.codinome} ({self.funcao}) usa a sua suprema!")


# HERANÇA
# os tanques utilizam os atributos da classe principal
class HeroiTanque(HeroiOverwatch):

    # modifica a ação da suprema para o estilo tanque
    def ativar_suprema(self):
        print(f"{self.codinome} ({self.funcao}) usa a suprema e avança na frente para proteger o time!")


class HeroiSuporte(HeroiOverwatch):

    # implementa uma versão própria da habilidade suprema
    def ativar_suprema(self):
        print(f"{self.codinome} ({self.funcao}) usa a suprema e fortalece todos os aliados!")

    # habilidade adicional disponível para os suportes
    def recuperar_aliados(self):
        print(f"{self.codinome} cura toda a equipe!")


if __name__ == "__main__":
    print("--- Supremas em Overwatch ---")

    # POLIMORFISMO
    # reúne diferentes tipos de heróis em uma única lista
    lista_herois: list[HeroiOverwatch] = [
        HeroiOverwatch("Soldado: 76", "Dano"),
        HeroiTanque("Reinhardt", "Tanque"),
        HeroiSuporte("Mercy", "Suporte"),
    ]

    for personagem in lista_herois:
        # chama a implementação correspondente ao tipo do herói
        personagem.ativar_suprema()

        # verifica se o personagem pertence à classe de suporte
        if isinstance(personagem, HeroiSuporte):
            personagem.recuperar_aliados()
