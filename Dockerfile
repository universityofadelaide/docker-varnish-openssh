FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add varnish openssh

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

COPY ./files/varnish.params /etc/varnish/varnish.params
COPY ./files/start.sh /start.sh

ENV VARNISH_CONFIG /etc/varnish/default.vcl
ENV VARNISH_MEMORY 64M
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

EXPOSE 22
EXPOSE 80
CMD ["/start.sh"]
