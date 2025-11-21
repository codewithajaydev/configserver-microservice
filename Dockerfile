FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY target/*.jar app.jar
COPY src/main/resources/config ./config

EXPOSE 8888

ENTRYPOINT ["java", "-jar", "app.jar"]
