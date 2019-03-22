# Merchant's Guide to the Galaxy

## Descrição do problema (em inglês)

You decided to give up on earth after the latest financial collapse left 99.99% of the earth's population with 0.01% of the wealth. Luckily, with the scant sum of money that is left in your account, you are able to afford to rent a spaceship, leave earth, and fly all over the galaxy to sell common metals and dirt (which apparently is worth a lot).
Buying and selling over the galaxy requires you to convert numbers and units, and you decided to write a program to help you.
The numbers used for intergalactic transactions follows similar convention to the roman numerals and you have painstakingly collected the appropriate translation between them.
Roman numerals are based on seven symbols:

| Symbol | Value |
| :---:  |  ---: |
| I      |     1 |
| V      |     5 |
| X      |    10 |
| L      |    50 |
| C      |   100 |
| D      |   500 |
| M      | 1,000 |

Numbers are formed by combining symbols together and adding the values. For example, MMVI is 1000 + 1000 + 5 + 1 = 2006. Generally, symbols are placed in order of value, starting with the largest values. When smaller values precede larger values, the smaller values are subtracted from the larger values, and the result is added to the total. For example MCMXLIV = 1000 + (1000 − 100) + (50 − 10) + (5 − 1) = 1944.
* The symbols "I", "X", "C", and "M" can be repeated three times in succession, but no more. (They may appear four times if the third and fourth are separated by a smaller value, such as XXXIX.) "D", "L", and "V" can never be repeated.
* "I" can be subtracted from "V" and "X" only. "X" can be subtracted from "L" and "C" only. "C" can be subtracted from "D" and "M" only. "V", "L", and "D" can never be subtracted.
* Only one small-value symbol may be subtracted from any large-value symbol.
* A number written in [16]Arabic numerals can be broken into digits. For example, 1903 is composed of 1, 9, 0, and 3. To write the Roman numeral, each of the non-zero digits should be treated separately. Inthe above example, 1,000 = M, 900 = CM, and 3 = III. Therefore, 1903 = MCMIII.
(Source: [Wikipedia](http://en.wikipedia.org/wiki/Roman_numerals))

Input to your program consists of lines of text detailing your notes on the conversion between intergalactic units and roman numerals.

You are expected to handle invalid queries appropriately.

**Test input:**

glob is I  
prok is V  
pish is X  
tegj is L  
glob glob Silver is 34 Credits  
glob prok Gold is 57800 Credits  
pish pish Iron is 3910 Credits  
how much is pish tegj glob glob ?  
how many Credits is glob prok Silver ?  
how many Credits is glob prok Gold ?  
how many Credits is glob prok Iron ?  
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?  

**Test Output:**

pish tegj glob glob is 42  
glob prok Silver is 68 Credits  
glob prok Gold is 57800 Credits  
glob prok Iron is 782 Credits  
I have no idea what you are talking about  

## Setup

Dependências:

* Ruby 2.6.1

### Instalação

```shell
gem install bundler
gem install rubocop #opcional
bundle install
```

## Instruções

Rodar o script:

```shell
./merchant.rb input.txt
```

Rodar os testes:

```shell
bin/rspec -c -f d spec/
```

Rodar o Rubocop (opcional):

```shell
rubocop . -c .rubocop.yml
```

## Descrição da Implementação

O script principal é o `merchant.rb`, que vai receber como argumento um arquivo texto com o input. Ele vai ler o arquivo, extrair todas as linhas e passá-las como um array para a classe `Merchant`. O script manda a resposta da classe para o stdout.

A class `Merchant`, por sua vez, vai receber esse array de frases, processá-las todas e retornar suas respostas, eliminando as vazias, em outro array.

### Processamento da frase

O primeiro desafio é entender qual é o input. Se é uma:

* atribuição de valor ('glob is I')
* conversão de moeda ('glob glob Silver is 34 Credits')
* pergunta de conversão de valor ('how much is pish tegj glob glob ?')
* pergunta de conversão de moeda ('how many Credits is glob prok Silver ?')
* qualquer outra coisa (erro)

Para isso serve a classe `InputParser`, que vai receber a frase e vai determinar qual das alternativas acima ela se encaixa. Se é um erro, já retorna a resposta de erro ('I have no idea what you are talking about'). Caso contrário, vai passar para um delegator (`OperationDelegator`), que vai determinar qual a classe apropriada para lidar com a frase.

#### `ValueAttributionProcessor`

Essa classe simplesmente pega a frase, identifica o número galático e o seu valor em números romanos e armazena na variável de instância `@galactic_numbers` da classe `Merchant`. Esse armazenamento é necessário para fazer os cálculos em memória quando a frase for uma pergunta.

#### `CurrencyAttributionProcessor`

Esta classe também armazena informações, só que na variável de instância `@metals`, da classe `Merchant`. A chave é o metal e o valor é o número arábico correspondente ao valor em números galáticos identificados na frase. A conversão é feita na classe  `GalacticNumberConverter`, que por sua vez chama `RomanNumberConverter` para fazer a conversão de números romanos para arábicos.

#### `ValueQuestionProcessor`

Esta classe parseia a pergunta e converte o número galático em número arábico, usando a correspondência em `@galactic_numbers` e as mesmas classes de conversão acima.

#### `CurrencyQuestionProcessor`

Esta classe, além de converter os números galáticos para arábicos, também pega o valor unitário da moeda, que está armazenado em `@metals` e faz a conta do valor total do metal.

### Lidando com input inválido

O script consegue lidar com os seguintes inputs inválidos:

* Números romanos inválidos. Ex: 'IIX'
* Números romanos que não são uma letra única nas frases de atribuição. Ex: 'glob is VII'
* Valores de créditos inválidos. Ex: 'glob prok Gold is lalala Credits'
* Frases que não se encaixem nos padrões de atribuição e pergunta

### Melhorias futuras

Poderia ter sido utilizada uma classe de erro, herdada de `StandardError`, que seria lançada e recuperada para exibir a mensagem, mas acho que seria um exagero para o desafio proposto, e poderia ficar para uma próxima iteração.