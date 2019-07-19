FROM openjdk:8-alpine

ENV SONAR_VERSION=6.7.5 \
    SONARQUBE_HOME=/opt/sonarqube \
    # Database configuration
    # Defaults to using H2
    SONARQUBE_JDBC_USERNAME=sonar \
    SONARQUBE_JDBC_PASSWORD=sonar \
    SONARQUBE_JDBC_URL=

# Http port
EXPOSE 9000

RUN addgroup -S sonarqube && adduser -S -G sonarqube sonarqube

RUN set -x \
    && apk add --no-cache gnupg unzip \
    && apk add --no-cache libressl wget \
    && apk add --no-cache su-exec \
    && apk add --no-cache bash

    # pub 2048R/D26468DE 2015-05-25
    # Key fingerprint = F118 2E81 C792 9289 21DB  CAB4 CFCA 4A29 D264 68DE
    # uid sonarsource_deployer (Sonarsource Deployer) <infra@sonarsource.com>
    # sub 2048R/06855C1D 2015-05-25
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys F1182E81C792928921DBCAB4CFCA4A29D26468DE 

#RUN mkdir /opt \
RUN cd /opt 
RUN wget -O sonarqube.zip --no-verbose https\://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip 
RUN wget -O sonarqube.zip.asc --no-verbose https\://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip.asc 
RUN gpg --batch --verify sonarqube.zip.asc sonarqube.zip 
RUN unzip sonarqube.zip 
RUN mv sonarqube-$SONAR_VERSION sonarqube 
RUN chown -R sonarqube:sonarqube sonarqube 
RUN rm sonarqube.zip* 
RUN rm -rf $SONARQUBE_HOME/bin/*



VOLUME "$SONARQUBE_HOME/data"

WORKDIR $SONARQUBE_HOME
COPY run.sh $SONARQUBE_HOME/bin/
ENTRYPOINT ["/bin/bash", "./bin/run.sh"]
