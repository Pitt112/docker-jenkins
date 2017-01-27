import jenkins.model.*

int numExecutors = Runtime.getRuntime().availableProcessors()

Jenkins.instance.setNumExecutors(numExecutors)
