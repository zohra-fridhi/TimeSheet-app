FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
#ADD target/timesheet-0.0.6-SNAPSHOTS.jar timesheet-0.0.6-SNAPSHOTS.jar
ENTRYPOINT ["java","-jar","/app.jar"]
