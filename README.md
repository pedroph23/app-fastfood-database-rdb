# Banco de Dados Relacional
Banco de Dados Relacional

Seja bem vindo(a)!

## Desenvolvedores
 
 - [Caike Burgos](https://github.com/caikeburgos)
 - [Pedro Ramalho](https://github.com/pedroph23)
 - [Marcus Gomes](https://github.com/mvgv)
 - [Maria Eulina Melo](https://github.com/xLinaMeloox)

    
## Ferramentas

A aplicação esta recheada de ferramentas, como:
- Java 17
- Spring Boot
- Docker
- Kubernetes
- Maven
- Postgres
- Swagger
    

Para iniciarmos, precisamos de algumas ferramentas para poder incializar a aplicação.
## Ferramentas Obrigatórias
- Docker 
- Git
- Docker Compose
- Kubernetes


Para poder estar instalando essas ferramentas, siga o link de instalação.

- **Windows**
   - https://docs.docker.com/desktop/install/windows-install/ [Docker & Docker Composer]
   - https://git-scm.com/download/win [Git]
   - https://kubernetes.io/docs/setup/ [Kubernetes]
 - **Linux**
   - https://docs.docker.com/desktop/install/linux-install/ [Docker]
   - https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Instalando-o-Git [Git]
   - https://docs.docker.com/compose/install/linux/ [Docker Compose]
   - https://kubernetes.io/docs/setup/ [Kubernetes]
 - **Mac**
   - https://docs.docker.com/desktop/install/mac-install/ [Docker & Docker Composer]
   - https://git-scm.com/download/mac [Git]
   - https://kubernetes.io/docs/setup/ [Kubernetes]

Logo após de ter instalado as ferramentas, agora podemos inicializar a nossa aplicação com o cluster kubernetes

## Inicializando a aplicação com o Kubernetes


> ⚠️ **Atenção!** 
>  Não é necessário alterar ou fornecer variáveis de ambiente para conectar com o banco
>  Verifique no arquivo ".app/mvnw", se EOL está configurado como "LF". 

**Para executar o projeto, siga os passos abaixo:**
- Executar a Build de Produção:
    > ⚠️ **Atenção! Para executar, é necessário estar dentro da raiz do projeto.**
    Dentro da raiz do projeto execute o comando a seguir:

    ```sh
    kubectl apply -f infra/prod
    ```
    Depois de executada, é necessário verificar se os pods estão prontos, através do comando kubectl get pods, a partir dai a aplicação estará disponível para uso em: http://localhost:8080/swagger-ui/index.html#/
    Se desejar, é possível também, realizar as chamadas via Postman, Insomnia ou outro app desejado, utilizando a Collection ("AppfastfoodCollection") disponível na raíz do projeto.

    > Como inserir informações na aplicação:
      - **Opcional** Criar Clientes,
      - Cadastrar Produtos,
      - Criar Pedidos.
      Não é possível criar um pedido, caso não exista produtos cadastrados.

- Caso deseje compilar e executar o projeto em ambiente de desenvolvimento, execute os comando abaixo:
    > ⚠️ **Atenção! Para executar, é necessário estar dentro da raiz do projeto.**
    Esse comando compila o código java, executa o jar do monolito e gera uma imagem nova, usem quando forem testar alteracoes do codigo:

    ```sh
    docker-compose -f ./infra/dev/docker-compose.yaml up 
    ```

## Inicializando a aplicação sem o container

Para poder estar rodando em maquina local sem o container docker e sem o Postgres, pois estará utiliza o banco H2. Deve realizar a instalação das seguintes ferramentas:

- Amazon Corretto 17 JDK
- Maven
- Lombok

#### Baixando as dependência
Comando para baixar as dependências do Maven:
```sh
mvn clean install 
```

Após o sucesso a da instalação, poderá inicializar a aplicação!
