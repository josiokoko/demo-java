FROM maven as Builder 
WORKDIR /app

RUN mvn -f /app/demo-app clean install


FROM tomcat:8.5
WORKDIR /app
COPY --from=Builder /app/demo-app/target/*.war ./

RUN apt-get update && \
  apt-get install -y \
    net-tools \
    tree \
    vim && \
  rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get purge


COPY /app/target/*.war /usr/local/tomcat/webapps/demo.war

EXPOSE 8280
CMD ["catalina.sh", "run"]
