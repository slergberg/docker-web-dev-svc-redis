# Base image
FROM redis:6.0.2-alpine

# Base dependencies
RUN apk add --no-cache \
  bash

# Expose ports
EXPOSE 6379 16379 26379

# Healthcheck
ADD ./docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck
HEALTHCHECK CMD docker-healthcheck

# Startup
ADD ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]
