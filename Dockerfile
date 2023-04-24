FROM openjdk:11
COPY /*.jar .
EXPOSE 8080
CMD ["java","-jar","*.jar"]
