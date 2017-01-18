FROM jenkins:2.32.1

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

COPY plugins.txt /var/jenkins_home/plugins.txt

RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
