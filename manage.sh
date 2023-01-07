#!/bin/bash

# Give the first argument a name for more readable code.
service_name=$1
service_root="./${service_name}"
service_compose="${service_root}/docker-compose.yml"

# Make sure there actually is some configuration for the given service name.
if [ ! -f  "${service_compose}" ]; then
    echo "No service group '${service_name}' found."
    exit 1
fi

# Load environment variables
. ${PWD}/.env

# Assemble the docker-compose command
DC="docker compose"

cd $service_root
eval $DC "${@:2}"
