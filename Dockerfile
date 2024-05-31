FROM maven as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk
WORKDIR /app
COPY --from=build /app/target/*.jar ./*.jar
CMD ["java", "-jar", "*.jar"]
