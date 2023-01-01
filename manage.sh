#!/bin/bash

# Give the first argument a name for more readable code.
service_group=$1
service_group_root="./${service_group}"
service_group_env="${service_group_root}/.env"
service_group_compose="${service_group_root}/docker-compose.yml"

# Make sure there actually is some configuration for the given service group.
if [ ! -f  "${service_group_compose}" ]; then
    echo "No service group '${service_group}' found."
    exit 1
fi

# Load environment variables
. ${PWD}/.env

# Assemble the docker-compose command
DC="PROJECT_NAME=${PROJECT_NAME} docker compose --project-name ${PROJECT_NAME}"

cd $service_group_root
eval $DC "${@:2}"
