FROM tomcat:latest
RUN cp -R  /workspace/cicd/webapp/*  /usr/local/tomcat/webapps
COPY /workspace/cicd/webapp/target/*.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
