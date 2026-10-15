from abc import ABC, abstractmethod


# CLASSE ABSTRATA
# estabelece o método que todas as unidades devem implementar
class IUnidadeDeRede(ABC):

    @abstractmethod
    def realizar_ataque(self):
        pass


# COMPONENTE INTERNO
# representa o equipamento utilizado pelo operador
class Cyberdeck:

    def __init__(self, nome_modelo: str):
        self.modelo = nome_modelo


# CLASSE QUE IMPLEMENTA O CONTRATO
# o operador possui um cyberdeck criado em sua inicialização
class OperadorNetrunner(IUnidadeDeRede):

    def __init__(self, nome_operador: str, equipamento: str):
        self.nome = nome_operador

        # o equipamento é instanciado dentro do próprio operador
        self.dispositivo = Cyberdeck(equipamento)

    def realizar_ataque(self):
        print(f"Netrunner {self.nome} usa o cyberdeck {self.dispositivo.modelo} "
              f"e está quebrando o gelo (ICE) de um servidor!")


# SEGUNDA CLASSE QUE IMPLEMENTA A INTERFACE
class DroneDeVigilancia(IUnidadeDeRede):

    def __init__(self, identificador: str):
        self.codigo = identificador

    def realizar_ataque(self):
        print(f"Drone {self.codigo} está interceptando o sinal da rede!")


# AGRUPAMENTO DE UNIDADES
# recebe objetos que foram instanciados separadamente
class CelulaHacker:

    def __init__(self, nome_grupo: str, unidades: list[IUnidadeDeRede]):
        self.nome = nome_grupo
        self.integrantes = unidades

    # POLIMORFISMO
    # cada integrante executa sua própria versão do método
    def comecar_operacao(self):
        print(f"\n--- Célula {self.nome} inicia o ataque com {len(self.integrantes)} unidades ---")

        for unidade in self.integrantes:
            unidade.realizar_ataque()


if __name__ == "__main__":
    print("--- Ataque em Night City ---")

    # cria os objetos antes de reuni-los no grupo
    operador = OperadorNetrunner("V", "Militech Paraline")
    unidade_aerea = DroneDeVigilancia("DRN-077")

    equipe = CelulaHacker("Voodoo Boys", [operador, unidade_aerea])
    equipe.comecar_operacao()
