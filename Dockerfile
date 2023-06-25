FROM maven as Builder 

RUN mvn clean install


FROM tomcat:8.5
COPY --from=Builder target/*.war ./

RUN apt-get update && \
  apt-get install -y \
    net-tools \
    tree \
    vim && \
  rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get purge


COPY *.war /usr/local/tomcat/webapps/demo.war

EXPOSE 8280
CMD ["catalina.sh", "run"]
