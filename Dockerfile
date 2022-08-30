FROM tomcat:latest AS base
EXPOSE 8080
FROM maven:3.8.6-jdk-11 AS build
WORKDIR /var/www
COPY . .
RUN mvn package
FROM base AS final
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /var/www/target/goldenWastedd-0.0.1-SNAPSHOT.jar goldenWastedd-0.0.1-SNAPSHOT.jar


CMD ["catalina.sh","run"]
