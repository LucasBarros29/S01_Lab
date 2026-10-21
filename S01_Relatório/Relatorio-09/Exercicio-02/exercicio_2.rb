class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  # método abstrato: as filhas precisam sobrescrever
  def interpretar(peca)
    raise NotImplementedError, "Cada instrumentista deve implementar interpretar"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) interpreta #{peca} e conduz a melodia principal"
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) interpreta #{peca} e acompanha o ritmo do solista"
  end
end

class Regente
  attr_reader :nome

  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "Regente #{@nome} conduz #{peca}"
    @orquestra.each { |i| i.interpretar(peca) }
  end

  # retorna um novo array de textos com classe e nome
  def escalacao
    @orquestra.map { |i| "#{i.class} - #{i.nome}" }
  end
end

# Main
solista = Solista.new("Kousei", "Piano")
acompanhador = Acompanhador.new("Kaori", "Violino")
regente = Regente.new("Maestro Arima")

regente.convocar(solista)
regente.convocar(acompanhador)

regente.reger("Sonata nº 1")
regente.escalacao.each { |texto| puts texto }

# Exercício 6: Instrumentista não implementa interpretar, gera NotImplementedError
# generico = Instrumentista.new("Teste", "Flauta")
# generico.interpretar("Sonata nº 1")
