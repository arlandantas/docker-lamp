#!/bin/sh

# Define usage function
usage() {
  # Echoes the instructions
  cat << USAGE >&2
Usage: $cmdname [OPTIONS]

OPTIONS
  --keep-env                 Don't remove .env file
USAGE
  # Return to shell
  exit 0
}

# Check if the first param is --help
if [ "$1" = '--help' ]
then
  # Execute usage function
  usage 0
fi

# Build and run the services from docker-compose.yml file
docker-compose up --build

# If the first param isn't "--keep-env"
if [ ! "$1" = '--keep-env' ]
then
  # Delete .env file
  rm .env
fi
