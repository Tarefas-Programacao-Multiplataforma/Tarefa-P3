FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /app

COPY ./pom.xml .
COPY ./mvnw .
COPY ./.mvn ./.mvn
RUN ./mvnw dependency:go-offline

COPY . .

RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]