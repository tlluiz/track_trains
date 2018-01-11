Problem description: Trains

The local commuter railroad services a number of towns in Kiwiland.  Because of monetary concerns, all of the tracks are 'one-way.'  That is, a route from Kaitaia to Invercargill does not imply the existence of a route from Invercargill to Kaitaia.  In fact, even if both of these routes do happen to exist, they are distinct and are not necessarily the same distance!

The purpose of this problem is to help the railroad provide its customers with information about the routes.  In particular, you will compute the distance along a certain route, the number of different routes between two towns, and the shortest route between two towns.

Input:  A directed graph where a node represents a town and an edge represents a route between two towns.  The weighting of the edge represents the distance between the two towns.  A given route will never appear more than once, and for a given route, the starting and ending town will not be the same town. For the test input, the towns are named using the first few letters of the alphabet from A to D.  A route between two towns (A to B) with a distance of 5 is represented as AB5.

Output: For test input 1 through 5, if no such route exists, output 'NO SUCH ROUTE'.  Otherwise, follow the route as given; do not make any extra stops!  For example, the first problem means to start at city A, then travel directly to city B (a distance of 5), then directly to city C (a distance of 4).

The distance of the route A-B-C.
The distance of the route A-D.
The distance of the route A-D-C.
The distance of the route A-E-B-C-D.
The distance of the route A-E-D.
The number of trips starting at C and ending at C with a maximum of 3 stops.  In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops).
The number of trips starting at A and ending at C with exactly 4 stops.  In the sample data below, there are three such trips: A to C (via B,C,D); A to C (via D,C,D); and A to C (via D,E,B).
The length of the shortest route (in terms of distance to travel) from A to C.
The length of the shortest route (in terms of distance to travel) from B to B.
The number of different routes from C to C with a distance of less than 30.  In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC, CEBCEBC, CEBCEBCEBC.
Test Input:

AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7

Test Output:

Output #1: 9

Output #2: 5

Output #3: 13

Output #4: 22

Output #5: NO SUCH ROUTE

Output #6: 2

Output #7: 3

Output #8: 9

Output #9: 9

Output #10: 7


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
