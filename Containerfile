ARG CADDY_VERSION=2.10.2

FROM docker.io/caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/corazawaf/coraza-caddy/v2 \
    --with github.com/corazawaf/coraza-geoip

FROM docker.io/caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

EXPOSE 80 443
