#!/bin/sh

/usr/sbin/sshd

mkdir -p /var/lib/varnish/`hostname` && chown nobody /var/lib/varnish/`hostname`
varnishd -F -f ${VARNISH_CONFIG} -s malloc,${VARNISH_MEMORY} ${VARNISHD_PARAMS}
