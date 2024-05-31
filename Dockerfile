FROM maven as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk
WORKDIR /app
COPY --from=build /app/target/gs-maven-0.1.0.jar ./gs-maven-0.1.0.jar
CMD ["java", "-jar", "gs-maven-0.1.0.jar"]
