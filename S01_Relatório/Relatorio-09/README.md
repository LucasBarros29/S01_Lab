# Exercícios de Ruby: Orientação a Objetos

Explicação das partes principais de cada exercício.

---

## Exercício 1: CoquetelAfterlife (Cyberpunk 2077)

- **`attr_reader :nome`**: cria só o método de leitura, então o nome pode ser lido de fora, mas não alterado. Por isso `objeto.nome = ...` gera `NoMethodError`.
- **`preco` e `preco=`**: getter e setter manuais, já que o preço fica em `@preco` sem `attr_reader`. O setter usa um `if` para validar a faixa de 5 a 200. Fora dela, mostra "Preço inválido!" e mantém o valor anterior.
- **`ficha`**: devolve a string com o retorno implícito, sem `puts`. Quem imprime é o `main`.
- **`DrinkDeLenda < CoquetelAfterlife`**: herda tudo do pai. O `super(nome, preco)` no `initialize` repassa os dois primeiros argumentos, e na `ficha` o `super` traz o texto do pai para acrescentar a lenda.
- **Main**: o `.each` percorre o array imprimindo cada ficha. O teste com 500 mostra "Preço inválido!" e o 80 é aceito.

---

## Exercício 2: Instrumentista (Your Lie in April)

- **`Instrumentista`**: classe base com `attr_reader` para nome e instrumento. O `interpretar` só faz `raise NotImplementedError`, indicando que as filhas devem definir o comportamento.
- **`Solista` e `Acompanhador`**: não têm `initialize` próprio, então usam o do pai. Cada uma sobrescreve `interpretar` com sua própria mensagem.
- **`Regente`**: guarda os músicos em `@orquestra`. O `convocar` adiciona com `<<`, o `reger` percorre com `.each` chamando `interpretar` de cada um, e o `escalacao` usa `.map` para devolver um novo array de textos, usando `.class` para mostrar o tipo do músico.
- **Main**: cria os músicos e o regente, convoca os dois, rege a peça e imprime a escalação com `.each`.
- **Erro do item 6**: instanciar `Instrumentista` direto funciona, mas chamar `interpretar` nele gera `NotImplementedError`.

---

## Exercício 3: LaboratorioDeGadgets (Steins;Gate)

- **`PhoneWave`**: só tem o `enviar_dmail`, que imprime a mensagem e avisa que foi para o passado.
- **`MembroDoLab`**: usa `attr_reader` para número e nome, então podem ser lidos de fora.
- **`LaboratorioDeGadgets`**: o `initialize` não recebe parâmetros e cria o `PhoneWave` e o array `@membros` vazio.
- **`admitir`**: recebe um membro já criado, adiciona com `<<` e imprime número e nome.
- **`experimento`**: percorre os membros com `.each` imprimindo número e nome, e depois chama o `enviar_dmail` do `@phonewave`.
- **Main**: cria os dois membros antes do laboratório, depois cria o laboratório, admite os dois e roda o experimento.

### Composição x Agregação

- **Composição**: o `PhoneWave` é criado dentro do `LaboratorioDeGadgets` (no `initialize`) e só existe nele. Se o laboratório deixar de existir, o aparelho vai junto.
- **Agregação**: os `MembroDoLab` são criados fora do laboratório e apenas recebidos em `admitir`. Eles continuam existindo mesmo sem o laboratório.

---

## Exercício 4: Investigacao (Sherlock Holmes)

- **`Depoente`**: módulo que funciona como contrato. O `depor` só faz `raise NotImplementedError`, então quem incluir precisa implementar o seu.
- **`Detivel`**: módulo com implementação pronta. O `ser_detido` imprime o nome (vindo do `attr_reader` da classe que o inclui) e que a pessoa foi levada pela Scotland Yard.
- **`Envolvido`**: classe base só com `attr_reader :nome` e o `initialize`. Não inclui nenhum módulo.
- **`TestemunhaOcular`**: herda de `Envolvido` e inclui só `Depoente`. Implementa `depor` com o que a testemunha viu. Como não inclui `Detivel`, não pode ser detida.
- **`SuspeitoDoCrime`**: herda de `Envolvido` e inclui `Depoente` e `Detivel`. Implementa `depor` com o álibi e ganha `ser_detido` do módulo.
- **`Investigacao`**: o `initialize` recebe o caso e cria `@envolvidos` vazio.
  - `registrar` adiciona um envolvido já criado (**agregação**).
  - `ouvir_todos` chama `depor` de cada um com `.each` (**polimorfismo**: cada classe depõe do seu jeito).
  - `acionar_scotland_yard` usa `.select` com `respond_to?(:ser_detido)` para separar quem pode ser detido e chama `ser_detido` de cada um.
- **Main**: cria a testemunha e dois suspeitos antes da investigação, depois cria a investigação, registra os três e chama `ouvir_todos` e `acionar_scotland_yard`. Só os suspeitos são detidos.
