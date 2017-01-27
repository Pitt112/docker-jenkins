import jenkins.model.*
import hudson.security.*

println("init user")

def jenkins = Jenkins.getInstance()
jenkins.setSecurityRealm(new HudsonPrivateSecurityRealm(false))
jenkins.setAuthorizationStrategy(new GlobalMatrixAuthorizationStrategy())

def user = jenkins.getSecurityRealm().createAccount("admin", "admin")
user.save()

jenkins.getAuthorizationStrategy().add(Jenkins.ADMINISTER, "admin")
jenkins.save()

println("init user done")
