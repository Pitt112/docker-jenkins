FROM jenkins:2.32.1

USER jenkins

COPY /system/init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/

COPY /system/home/* /var/jenkins_home/

COPY /custom/init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/

COPY /custom/home/* /var/jenkins_home/

#RUN chown -R jenkins:jenkins /var/jenkins_home


USER jenkins

#RUN ["chown" ,"jenkins", "/var/jenkins_home/plugins.txt"]
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

#RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo 2.32.2 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo 2.32.2 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

#USER root
#COPY /content /var/jenkins_home/userContent


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
