
# Delete the old backup to not mix any data
rm -rf ./backup

# Creating required folders
mkdir -p ./backup

# Backing up the Database
. ./.env

docker compose exec --no-TTY ${DB_HOSTNAME} pg_dump \
	--format=plain \
	--create \
	--no-security-labels \
	--username=${DB_USERNAME} \
	--dbname=${DB_DATABASE_NAME} \
	> ./backup/dump.sql
