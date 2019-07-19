# Sonarqube code quality

## Run sonarqube container

To run the Sonarqube and Postgresql docker containers you should execute the following command:

```
docker-compose up --build
```

When you open the Docker console, it show you a local IP, the IP should be copied for later use, Sonarqube service is accessible in the port number 9000.

Open Chrome or Mozilla browser and go to the next address:
```
http://IP:9000
http://192.168.99.100:9000
```

# Run analysis

## 1. Download maven mvn
[apache-maven-3.6.1-bin.zip](https://maven.apache.org/download.cgi)



# References
* [sonarqube with alphine](https://github.com/SonarSource/docker-sonarqube/blob/master/6.7.1-alpine/Dockerfile)
* [docker-composre](https://github.com/SonarSource/docker-sonarqube/blob/master/recipes.md)
