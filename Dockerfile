FROM maven:3.8.7-eclipse-temurin-19 AS build

COPY src /app/src
COPY pom.xml /app

WORKDIR /app

RUN mvn clean package -DskipTests

FROM openjdk:21-jdk

COPY --from=build /app/target/longeviverfitness-0.0.1-SNAPSHOT.jar /app/app.jar

WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
