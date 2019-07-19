#!/bin/sh
echo "start run.sh"
# chown -R sonarqube:sonarqube $SONARQUBE_HOME
echo "chown run.sh"
exec su-exec sonarqube java -jar /sonarqube/lib/sonar-application-$SONAR_VERSION.jar -Dsonar.log.console=true -Dsonar.jdbc.username="$SONARQUBE_JDBC_USERNAME" -Dsonar.jdbc.password="$SONARQUBE_JDBC_PASSWORD" -Dsonar.jdbc.url="$SONARQUBE_JDBC_URL" -Dsonar.web.javaAdditionalOpts="$SONARQUBE_WEB_JVM_OPTS -Djava.security.egd=file:/dev/./urandom"
echo "end run.sh"