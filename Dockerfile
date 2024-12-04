FROM alpine:3.20.1

RUN apk add --update --no-cache bash catatonit sane-saned sane-utils sane-backends busybox-extras && \
    echo "6566 stream tcp nowait root.root /usr/sbin/saned saned" >/etc/inetd.conf && \
    addgroup saned lp && \
    rm -rf /etc/sane.d/dll.d/* /etc/sane.d/dll.conf

ADD entrypoint.sh /entrypoint.sh

EXPOSE 6566-6570
ENV DATA_PORT_RANGE="6567-6570" ALLOW_HOSTS="192.168.1.0/24" BACKENDS=""

ENTRYPOINT [ "/usr/bin/catatonit", "--" ]
CMD [ "/entrypoint.sh" ]
