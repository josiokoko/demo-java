FROM tomcat:8.5

# RUN apt-get update && \
#   apt-get install -y \
#     net-tools \
#     tree \
#     vim && \
#   rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get purge

COPY target/*.war /usr/local/tomcat/webapps/demo.war

EXPOSE 8280
CMD ["catalina.sh", "run"]
