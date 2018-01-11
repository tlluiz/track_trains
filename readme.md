O Problema do Trem

Explicando o solução utilizada:

A classe ```Trips``` é a interface principal do apicativo, então todos os métodos
necessários para interagir com a aplicação estão neles.

A classe ```PossibleTrips```` é a principal parte da solução e responsável por
percorrer a estrutura de dados e retornar as possíveis viagens (método ```count_trips```)
e também a menor distância dada uma viagem (método ```distance_of_trips```).

Estrutura de Dados:

Pensei em utilizar uma matriz bidimensional para representar todas as rotas
possíveis, porém, por ser uma matriz espeçada e com poucas rotas e muitos pontos
sem ligação, não achei que seria uma boa ideia.

Pensei também que poderia utilizar Hash, representando assim somente os caminhos
necessários, ocupando menos memória do que a matriz, mas o acesso aos dados nessa
estrutura pode tornar o código menos compreensível.

Por fim achei melhor usar estruturas (Struct) e assim poderia nomear melhor os
attributos e tornar tudo mais legível em cada parte do apliativo.

Como resultado desse estudo foram criadas duas estruturas:

- Track: guarda o ponto inicial, ponto final e a distância de cada caminho.
- Route: armazena o ponto inicial e o ponto final de casa rota.

Parsers:

Para manipular as strings de dados da forma como o programa necessita, criei
dois parsers:

- TracksParser: Para criar todos os caminhos possíveis com suas respectivas distâncias.
- RoutesParser: Para criar as rotas que serão seguidas pele trem em uma viagem.

Finder:

Para procurar cada um dos caminhos, dado um ponto inicial ou final, achei melhor
criar uma classe específica para isso, chamada ```TrackFinder```.

PS: na pasta ```/drafts``` adicionei 3 fotos dos rascunhos que fiz enquanto pensava
na melhor forma de fazer a aplicação :).

PS 2: não consegui resolver todos os dez outputs propostos no tempo disponibilizado
e como o prazo estava finalizado resolvi enviar incompleto.

Rodando a Aplicação:

Para rodar o aplicativo é necessário ter o Ruby 2.4.1 e a gem bundler instalados
e instalar as dependências executando:

$> bundle install

Acesse a pasta ```/lib```:

$> cd lib

Depois execute o programa em si:

$> irb -I . -r trips.rb

Agora instancie a class Trips:

irb> trip = Trips.new(['AB5','BC4','CD8','DC8','DE6','AD5','CE2','EB3','AE7'])

Breve descrição dos métodos de instância do Trips:

O método ```distance_of_the_route```, dado uma rota (Ex. 'A-B-C'), retorna a
distâncis percorrida nessa rota.

O método ```number_of_trips```, dado um ponto inicial, um ponto final e
o máximo de paradas, ele retorna quantas são as rotas possíveis. Incluindo o
mínino de paradas, ele retorna quantas rotas com o mínimo de paradas informadas.

O métdo ```distance_of_shortest_trip```, dado um ponto inicial e um ponto final
é retornada a rota mais curta em relação a distância.


Testes:

Utilizei Rspec para fazer os testes e eles foram criados usando TDD.
Tods classes e métodos públicos estão testados.

Para rodar os testes só é necessário rodar o comando:

$> rspec
