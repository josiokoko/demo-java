FROM tomcat:8.5
LABEL EMAIL="j****@gmail.com"

RUN apt-get update && \
  apt-get install -y \
    net-tools \
    tree \
    vim && \
  rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get purge

COPY /var/jenkins_home/workspace/demo-app/target/*.war /usr/local/tomcat/webapps/demo.war

EXPOSE 8280
CMD ["catalina.sh", "run"]
