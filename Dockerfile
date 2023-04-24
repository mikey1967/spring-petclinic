FROM ubuntu:latest
COPY /*.jar .
EXPOSE 8080
CMD ["java","-jar","*.jar"]
