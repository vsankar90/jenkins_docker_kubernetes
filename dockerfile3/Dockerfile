FROM alpine/git
WORKDIR /app
RUN git clone  https://github.com/mitreid-connect/simple-web-app.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/simple-web-app /app 
RUN mvn package 

