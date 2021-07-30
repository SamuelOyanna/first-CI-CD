# the first stage of our build will use a maven 3.6.1 parent image
FROM maven:3.8.1-jdk-8-openj9 AS MAVEN_BUILD

# copy the pom and src code to the container
COPY ./ ./

# package our application code
RUN mvn clean package

# the second stage of our build will use open jdk 8 on alpine 3.9
FROM openjdk:8-jre-alpine

# copy only the artifacts we need from the first stage and discard the rest
COPY --from=MAVEN_BUILD target/first-ci-cd-0.0.1-SNAPSHOT.jar /app.jar

# set the startup command to execute the jar
CMD ["java", "-jar", "/app.jar"]