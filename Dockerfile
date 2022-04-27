FROM openjdk:8-jre-alpine

COPY java-app/target/*jar /app/app.jar

CMD java -jar /app/app.jar