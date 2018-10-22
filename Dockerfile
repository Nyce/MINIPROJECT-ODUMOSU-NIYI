FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=target/
COPY ${DEPENDENCY}/miniproject-odumosu-niyi-0.1.0.jar /app
ENTRYPOINT ["java","-jar","app/miniproject-odumosu-niyi-0.1.0.jar"]