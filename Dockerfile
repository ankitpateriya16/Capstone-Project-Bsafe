FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY target/user-svc-0.0.1-SNAPSHOT.jar user-svc.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "user-svc.jar"]
