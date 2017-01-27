import hudson.security.*
import hudson.plugins.active_directory.*

Jenkins.instance.setSecurityRealm(new ActiveDirectorySecurityRealm("moonset-engine.de", "site", "moonset-engine\\jenkins", "password", "deacs"))





def strategy = (GlobalMatrixAuthorizationStrategy)Jenkins.instance.getAuthorizationStrategy()
println(strategy.groups)

strategy.add(Jenkins.ADMINISTER, "GRP_JENKINS_Admin")

println(strategy.groups)

Jenkins.instance.save()
