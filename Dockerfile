FROM alpine/git
WORKDIR /app
RUN git clone  https://github.com/efsavage/hello-world-war      

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/hello-world-war /app 
RUN mvn package 

FROM tomcat:8.0
COPY --from=1 /app/target/hello-world-1.0.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
