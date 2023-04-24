FROM ubuntu:latest
COPY target/*.jar .
EXPOSE 8080
CMD ["java","-jar","*.jar"]
