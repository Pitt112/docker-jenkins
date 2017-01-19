FROM jenkins:2.32.1

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

COPY /userContent var/jenkins_home/
USER root
ADD http://afonsof.com/jenkins-material-theme/dist/material-indigo.css var/jenkins_home/userContent/material.css
RUN cat var/jenkins_home/userContent/material.css
RUN sed -i "s#@import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500,300);@import url(https://fonts.googleapis.com/css?family=Roboto+Mono:400,700,500,300);#@import url(roboto.css);#g" /var/jenkins_home/userContent/material.css
