# contrato: quem incluir precisa implementar depor
module Depoente
  def depor
    raise NotImplementedError, "Cada envolvido deve depor do seu jeito"
  end
end

# implementação pronta: usa o nome da classe que incluir o módulo
module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard"
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{@nome} (testemunha) diz: vi um homem de casaco escuro saindo pela janela"
  end
end

class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  def depor
    puts "#{@nome} (suspeito) diz: eu estava no clube de xadrez a noite toda"
  end
end

# agregação: os envolvidos são criados fora e apenas registrados
class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  # polimorfismo: cada envolvido depõe do seu jeito
  def ouvir_todos
    puts "Caso: #{@caso}"
    @envolvidos.each { |e| e.depor }
  end

  # só quem tem ser_detido (inclui Detivel) é levado
  def acionar_scotland_yard
    @envolvidos.select { |e| e.respond_to?(:ser_detido) }.each { |e| e.ser_detido }
  end
end

# Main
testemunha = TestemunhaOcular.new("Sra. Hudson")
suspeito1 = SuspeitoDoCrime.new("Moriarty")
suspeito2 = SuspeitoDoCrime.new("Irene Adler")

investigacao = Investigacao.new("O Mistério de Baker Street")
investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard
