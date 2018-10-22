FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=target/dependency

COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
COPY newrelic.jar app/
COPY newrelic.yml app/
COPY target/miniproject-odumosu-niyi-0.1.0.jar /app
ENTRYPOINT ["java", "-javaagent:app/newrelic.jar", "-jar", "/app/miniproject-odumosu-niyi-0.1.0.jar"]