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

## Credentials
* User: admin
* Password: admin

# Create token
1. Click on user
2. Click in sercurity
3. Generate token with sonar_user_token name

# Create a project (optional)
1. Crear project with the same name that the project folder
2. Asociate sonar_user_token created

# Install sonarScanner in linux
1. apt-get update
2. apt-get install unzip wget nodejs
3. mkdir /downloads/sonarqube -p
4. cd /downloads/sonarqube
5. wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
6. unzip sonar-scanner-cli-4.2.0.1873-linux.zip
7. mv sonar-scanner-4.2.0.1873-linux /opt/sonar-scanner

# Folders for environments
1. DEV: data_dev, logs_dev, extensions_dev
2. PROD: data_prod, logs_prod, extensions_prod

# Run analysis with sonnar scanner in windows

* Web : "c:\Users\Usuario\Documents\programas\sonar-scanner-cli-4.6.0.2311-windows\bin\sonar-scanner" -Dsonar.projectKey=ae58474eed52f94699cab87b8c9baae1151e6a83 -Dsonar.host.url=http://localhost:9000  -Dsonar.java.binaries=node_modules -Dsonar.projectName=tse_internal_web

* API in java: "c:\Users\Usuario\Documents\programas\sonar-scanner-cli-4.6.0.2311-windows\bin\sonar-scanner" -Dsonar.projectKey=ae58474eed52f94699cab87b8c9baae1151e6a83 -Dsonar.host.url=http://localhost:9000 -Dsonar.java.binaries=target -Dsonar.projectName=tse_internal_backend


# Run analysis with sonnar scanner in linux

* Web : "/var/opt/sonar-scanner-4.2.0.1873-linux/bin/sonar-scanner" -Dsonar.projectKey=fe092d7ac94e4d2c6562731015e574e026f992b6 -Dsonar.host.url=http://localhost:5010  -Dsonar.java.binaries=node_modules -Dsonar.projectName=tse_internal_web

* API in java: /home/developer/tse_internal_backend# "/var/opt/sonar-scanner-4.2.0.1873-linux/bin/sonar-scanner" -Dsonar.projectKey=fe092d7ac94e4d2c6562731015e574e026f992b6 -Dsonar.host.url=http://localhost:5010 -Dsonar.coverage.exclusions=.git -Dsonar.java.binaries=.git -Dsonar.sources=src -Dsonar.projectName=tse_internal_backend -X

# References
* [Sonnar scanner Windows 64-bit](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)
* [Sonnar scanner linux](https://techexpert.tips/sonarqube/sonarqube-scanner-installation-ubuntu-linux/)
* [sonnar scanner linux as service](https://www.digitalocean.com/community/tutorials/how-to-ensure-code-quality-with-sonarqube-on-ubuntu-18-04)
* [Sonnar scanner documentario](https://docs.sonarqube.org/latest/analysis/analysis-parameters/)
* [Docker compose reference](https://gist.github.com/Warchant/0d0f0104fe7adf3b310937d2db67b512)
