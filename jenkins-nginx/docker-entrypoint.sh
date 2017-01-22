#!/bin/bash

set -e

# Add logstash as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- nginx "$@"
fi

# Run as user "logstash" if the command is "logstash"
if [ "$1" = 'nginx' ]; then
	set -- gosu nginx "$@"
fi

exec "$@"
