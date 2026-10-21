class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @preco = preco
  end

  # getter manual
  def preco
    @preco
  end

  # setter manual: só aceita valores de 5 a 200
  def preco=(valor)
    if valor >= 5 && valor <= 200
      @preco = valor
    else
      puts "Preço inválido!"
    end
  end

  # retorna (não imprime) o texto
  def ficha
    "#{@nome} - R$ #{@preco}"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  # reaproveita o texto do pai com super
  def ficha
    super + " | Lenda: #{@lenda}"
  end
end

# Main
drinks = [
  CoquetelAfterlife.new("Mox Sunrise", 40),
  DrinkDeLenda.new("Johnny Silverhand", 120, "Rockerboy que desafiou a Arasaka"),
  DrinkDeLenda.new("Panam Palmer", 90, "Nômade do clã Aldecaldos")
]

drinks.each { |d| puts d.ficha }

# testando o setter nos drinks de lenda
drinks[1].preco = 500   # inválido
drinks[1].preco = 80    # válido
puts drinks[1].ficha

# Exercício 6: sem attr_writer, isso gera NoMethodError
# drinks[0].nome = "Novo nome"
