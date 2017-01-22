build:
	@docker-compose -p jenkins -f docker-compose.yml -f docker-compose-logging.yml build
run:
	@docker-compose -p jenkins -f docker-compose.yml -f docker-compose-logging.yml up -d nginx master
stop:
	@docker-compose -p jenkins -f docker-compose.yml -f docker-compose-logging.yml stop
clean:	stop
	@docker-compose -p jenkins -f docker-compose.yml -f docker-compose-logging.yml rm master nginx
clean-data: clean
	@docker-compose -p jenkins -f docker-compose.yml -f docker-compose-logging.yml rm -v
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
state:
	@docker-compose ps
passwd:
	@docker-compose exec master cat var/jenkins_home/secrets/initialAdminPassword
