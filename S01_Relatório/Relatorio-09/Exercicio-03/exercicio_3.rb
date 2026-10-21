class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail enviado para o passado: #{mensagem}"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Membro admitido: Lab Mem #{membro.numero} - #{membro.nome}"
  end

  def experimento(mensagem)
    @membros.each { |m| puts "Presente: Lab Mem #{m.numero} - #{m.nome}" }
    @phonewave.enviar_dmail(mensagem)
  end
end

# Main
okabe = MembroDoLab.new(1, "Okabe Rintaro")
mayuri = MembroDoLab.new(2, "Mayuri Shiina")

lab = LaboratorioDeGadgets.new
lab.admitir(okabe)
lab.admitir(mayuri)

lab.experimento("Tutturu! Nada de ir ao laboratório hoje.")

# Composição: o PhoneWave é criado dentro do LaboratorioDeGadgets (no initialize)
# e só existe nele. Se o laboratório deixar de existir, o PhoneWave vai junto.
# Agregação: os MembroDoLab são criados fora do laboratório e apenas recebidos
# em admitir. Eles continuam existindo mesmo sem o laboratório.
