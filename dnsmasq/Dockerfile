FROM alpine:latest

LABEL com.centurylinklabs.watchtower.enable="false"

RUN apk --no-cache add dnsmasq \
    && echo "conf-dir=/etc/dnsmasq,*.conf" > /etc/dnsmasq.conf

EXPOSE 53/tcp 53/udp

CMD ["dnsmasq"]
