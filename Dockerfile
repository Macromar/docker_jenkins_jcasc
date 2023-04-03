FROM jenkins/jenkins:jdk11
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
ENV JENKINS_OPTS --prefix=/jenk

COPY ./plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
COPY ./casc.yaml /var/jenkins_home/casc.yaml
COPY ./secrets var/jenkins_home/secrets
USER root
RUN  chown -R jenkins: var/jenkins_home/secrets

EXPOSE 8080
#EXPOSE 50000

