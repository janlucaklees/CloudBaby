
# Restoring the Database
. ./.env

docker compose exec --no-TTY ${DB_HOSTNAME} psql \
	--username=${DB_USERNAME} \
	--dbname=${DB_DATABASE_NAME} \
	< ./backup/dump.sql
