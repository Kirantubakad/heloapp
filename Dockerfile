FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY /home/ubuntu/workspace/cicd/webapp/target*.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
