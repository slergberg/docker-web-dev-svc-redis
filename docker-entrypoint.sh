#!/usr/bin/env sh
set -e

# Redis configuration
if [ ! -z "$REDIS_PASSWORD" -a "$REDIS_PASSWORD" != " " ]; then
    echo "requirepass ${REDIS_PASSWORD}" > /etc/redis.conf
fi

if [ "$1" = "redis-server" ]; then
    exec redis-server /etc/redis.conf "${@:2}"
fi

exec redis-server /etc/redis.conf "$@"
