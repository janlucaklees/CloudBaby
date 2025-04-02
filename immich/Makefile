export TZ=Europe/Berlin
export DOMAIN=immich.janlucaklees.de

export VERSION=v1.131.3

export TRAEFIK_CONTAINER_IP := $(shell docker inspect --format '{{ .NetworkSettings.Networks.traefik_network.IPAddress }}' $(shell docker ps -aqf "name=traefik"))

export DATABASE_NAME=postgres
export DATABASE_USER=immich

DATABSE_SNAPSHOT_PATH=/home/jlk/CloudBaby/immich/snapshot.sql

.PHONY: start
start:
	docker compose up -d

.PHONY: ps
ps:
	docker compose ps

.PHONY: logs
logs:
	docker compose logs -f

.PHONY: restart
restart:
	docker compose restart

.PHONY: pull
pull:
	docker compose pull

.PHONY: stop
stop:
	docker compose stop

.PHONY: remove
remove:
	docker compose down


.PHONY: database_snapshot
database_snapshot:
		docker compose exec --no-TTY database pg_dump \
			--role=${DATABASE_USER} \
			--username=${DATABASE_USER} \
			--dbname=${DATABASE_NAME} \
			--format=tar \
			--no-security-labels \
			--no-owner \
			--verbose \
			> ${DATABSE_SNAPSHOT_PATH}

.PHONY: database_restore
database_restore:
	docker compose up -d database
	sleep 5
	docker compose exec --no-TTY database pg_restore \
		--role=${DATABASE_USER} \
		--username=${DATABASE_USER} \
		--dbname=${DATABASE_NAME} \
		--format=tar \
		--no-security-labels \
		--no-owner \
		--verbose \
		< ${DATABSE_SNAPSHOT_PATH}
