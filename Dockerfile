FROM alpine:3.10

RUN VERSION=v1.0.4; \
    apk add --no-cache ca-certificates curl; \
    curl "https://caddyserver.com/download/linux/amd64?license=personal&telemetry=off&version=${VERSION}" -o caddy.tar.gz; \
    tar -zxvf caddy.tar.gz caddy; \
    rm -rf caddy.tar.gz ; \
    mv caddy /usr/local/bin/

COPY Caddyfile /etc/Caddyfile

ENTRYPOINT ["caddy"]

CMD ["--conf", "/etc/Caddyfile", "-disable-http-challenge", "-disable-tls-alpn-challenge"]

ARG BUILD_DATE

ARG MANTAINER