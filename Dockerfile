
FROM alpine:latest
RUN apk update
RUN apk add openjdk11
RUN mkdir /usr/local/tomcat
WORKDIR /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz .
RUN tar -xvzf apache-tomcat-8.5.82.tar.gz
RUN mv apache-tomcat-8.5.82/* /usr/local/tomcat
EXPOSE 8080
ADD webapp.war /usr/local/tomcat/webapps/
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
