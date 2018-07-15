FROM maven:3-alpine

MAINTAINER Simone Soldateschi <simone.soldateschi@gmail.com>

RUN apk add --update git && rm -rf /var/cache/apk/*
RUN git clone https://github.com/soldasimo/hello-world-copy.git /hello-world

RUN mvn -f /hello-world/pom.xml clean package

EXPOSE 8080

# TODO -- Run Java Spring boot app properly
CMD ["mvn", "-f", "/hello-world", "package", "spring-boot:run"]

