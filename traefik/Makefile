.PHONY: context
context:
	docker context use CCloudBaby

.PHONY: update_config
update_config:

.PHONY: deploy
deploy: update_config
	docker stack deploy --detach -c docker-stack.yml traefik
