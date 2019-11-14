![Travis](https://travis-ci.org/JeanVinge/desafio-ios.svg?branch=master)

Este desafio foi feito para a [Avaliação para Engenheiro de Software iOS Peixe Urbano / Groupon LATAM](https://github.com/JeanVinge/desafio-ios/blob/master/Avaliacao.md)

## Requisitos

- [x] xcode 11.2.1 ou superior
- [x] bundler versão 2 ou superior

## Funcionalidades

- [x] Suporte iPhones menores "Iphone 5s", orientação portrait
- [x] Armazenamento local das ofertas baixadas (offline-first)
- [x] Desenvolver o teste sem utilizar Interface Builder
- [x] Listagem de em cidades, viagens e produtos
- [x] botão de like selecionando e persistindo produtos
- [x] CI com travis

## Instalação

Para executar o desafio antes voce precisa executar os seguintes passos:

- bundle install "recomendado versão 2 ou superior"
- bundle exec pod install
- Abrir App.xcworkspace
- Executar scheme App

## Arquitetura

O desafio foi feito de forma modular, tentando separar o maximo as responsabilidades do Aplicativo, como por exemplo requisições, modelos, temas, strings e etc. o motivo desta escolha de paradigma foi para maximizar o reuso do codigo assim podendo criar bibliotecas atraves desses modulos.

A arquitetura utilizada é uma mistura de Clean Architecture por conta da separação de modulos com MVP, tentando ser bem simples e fazendo um reuso robusto do codigo.

## O que significa?

- MVP: O Model View Presenter, no caso do desafio eu optei por utilizar desta forma para tirar a logica da viewcontroller, e separar em uma camada te de flexibilidade para reutilizar a logica de negocio, e fazer com que a view não tenha muita complexidade fazendo que ela cuide apenas de desenhar os componentes na tela.

- Coordinator: Utilizei o conceito simples do coordinator, do [Soroush Khanlou](https://www.youtube.com/watch?v=a1g3k3NObkE), que é um conceito bem simples que separa a navegação da viewcontroller, e com isso tire outra responsabilidade da viewcontroller.

- Future/Promise: A future ajuda com o callback hell gerado por codigo utilizado por closures, o future simplifica e ao inves de retornar completions blocks, é retornado objetos de Future que contem metodos para observar resposta de uma chamada assincrona, eu me inspirei no codigo do [John Sundell](https://www.swiftbysundell.com/articles/under-the-hood-of-futures-and-promises-in-swift/) que é muito efetivo e simples.

- View/Code: Para criação de layout eu utilizei um wrapper do NSLayoutAnchor, esse codigo eu já tenho um repositorio chamado [Tanjiro](https://github.com/JeanVinge/Tanjiro), então para isso eu importei ele no desafio, o Tanjiro é bem parecido com o [SnapKit](https://github.com/SnapKit/SnapKit).

- Preferir Protocolos ao inves de classes: Quando voces olharem o desafio, verão que existe muita abstração no codigo, e muito uso de protocolo, a minha escolha é por conta do reuso de codigo, facilidade para criar mock de testes, generalização de codigo e interfaces, dando assim mais liberdade para criar a partir de alguma interface, e como conselho da apple prefira protocolos ao inves de classe, claro que nao da para levar ao pé da letra porem ajuda em varios casos.

## Separação do Desafio

Quando baixado o desafio é possivel ver que existem varios projetos dentro do App.workspace, aqui vou explicar cada um:

- App: O Projeto do app é onde acontece todo o funcionamento do aplicativo, o App consiste em receber todas as dependencias, Utility, Resources etc, e utilizar para fazer o App de fato.

- Utility: o modulo de utility é usado para guardar extensoes, componentes, e coisas que facilitem o desenvolvimento do app, o seu principal objeto é ter como se fosse uma bolsa de ferramentas para que quando eu precise eu importe e use a ferramenta desejada.

- Resources: o modo de resources guarda coisas ligadas a tema, por exemplo strings de localizable, imagens de icones etc.

- NetworkLayer: a camada de network faz todo o tratamento para uma requisição, e devolve para o app interfaces já implementadas para que seja possivel acessar API's.

- Domain: o domain se refere a todo contrato usado pelo App, tudo que a camada de internet precisa de informação ao receber um json fica la.

- Future: esse modulo como eu me referi acima é sobre a biblioteca de future que ajuda o app com requisicoes assincronas.

- Persistence: a camada de persistencia tem algumas interfaces que possibilitam criar novas persistencias, e a persistencia utilizada no projeto que no caso foi o UserDefaults, nesse modulo tem toda abstração e wrapper para facilitar o uso no app.
