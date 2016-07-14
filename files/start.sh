#!/bin/sh

/usr/sbin/sshd

mkdir -p /var/lib/varnish/`hostname` && chown nobody /var/lib/varnish/`hostname`
varnishd -f ${VARNISH_CONFIG} -s malloc,${VARNISH_MEMORY} ${VARNISHD_PARAMS}
sleep 1
varnishlog
