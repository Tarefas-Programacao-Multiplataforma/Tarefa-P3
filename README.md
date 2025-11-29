Este projeto é uma aplicação **Spring Boot** que utiliza **Spring Cloud Stream** e **Spring Cloud Function** para consumir mensagens de um tópico Kafka.

## Implementação

A aplicação foi desenvolvida utilizando **Java 21** e **Spring Boot 3.5.7**.

A lógica principal reside na classe `MessageFunction`, que expõe um `Consumer<Message>` como um Bean do Spring.
- **Consumer**: `messageConsumer`
- **Funcionalidade**: O consumidor recebe um objeto `Message` (DTO) e imprime o seu valor no console.

A integração com o Kafka é abstraída pelo Spring Cloud Stream, permitindo que a função foque apenas na regra de negócio.

## Como executar

O projeto inclui um arquivo `docker-compose.yml` que orquestra a infraestrutura necessária (Zookeeper e Kafka) e a própria aplicação.

### Pré-requisitos
- Docker
- Docker Compose

### Passos
1. Na raiz do projeto, execute o comando:
   ```bash
   docker-compose up --build
   ```
2. O Docker Compose irá subir os seguintes serviços:
   - **zookeeper**: Serviço de coordenação para o Kafka.
   - **kafka**: Broker de mensagens (acessível em `localhost:9092`).
   - **app**: A aplicação Spring Boot, configurada para conectar ao Kafka.

3. Para verificar os logs da aplicação e ver o consumo de mensagens:
   ```bash
   docker logs -f modulo3_app
   ```

## Pipeline CI/CD

O projeto conta com um workflow do **GitHub Actions** configurado em `.github/workflows/deploy.yml`.

### Funcionamento
O pipeline é acionado automaticamente a cada **push** na branch `main`.

As etapas do pipeline são:
1. **Checkout**: Baixa o código fonte do repositório.
2. **Login no Docker Hub**: Autentica no registro de containers utilizando secrets configuradas (`DOCKERHUB_USERNAME` e `DOCKERHUB_TOKEN`).
3. **Build**: Constrói a imagem Docker da aplicação.
4. **Push**: Envia a imagem gerada para o Docker Hub com a tag `latest`.

Isso garante que a imagem da aplicação no Docker Hub esteja sempre atualizada com a versão mais recente do código.
