# ---------- STAGE 1: Build ----------
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# ---------- STAGE 2: Runtime ----------
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy JAR from builder stage
COPY --from=builder /build/target/*.jar app.jar

# Copy config folder
COPY src/main/resources/config ./config

EXPOSE 8888

ENTRYPOINT ["java", "-jar", "app.jar"]
