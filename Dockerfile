FROM jenkins:2.32.1

USER jenkins
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

USER root
COPY /userContent /var/jenkins_home/userContent

ADD http://afonsof.com/jenkins-material-theme/dist/material-indigo.css var/jenkins_home/userContent/material.css
RUN chown -R jenkins /var/jenkins_home/userContent
USER jenkins

#RUN ls -halt var/jenkins_home/userContent
#USER root
#RUN chown jenkins:jenkins var/jenkins_home/userContent/material.css
#RUN ls -halt var/jenkins_home/userContent

#RUN ls -halt var/jenkins_home/
#RUN ls -halt var/jenkins_home/userContent/
#RUN chown jenkins var/jenkins_home/*
#RUN ls -halt var/jenkins_home/userContent/

#USER root
#USER
#RUN ["sed", "-i bak -e", "s#@import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500,300);@import url(https://fonts.googleapis.com/css?family=Roboto+Mono:400,700,500,300);#@import url(roboto.css);#g", "var/jenkins_home/userContent/material.css" ]
#RUN ls -halt var/jenkins_home/userContent/material.css
#USER jenkins
#RUN grep --color @im ./var/jenkins_home/userContent/material.css2
