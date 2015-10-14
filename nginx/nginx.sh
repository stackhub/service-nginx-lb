#!/bin/sh
# confd does not yet allow for dynamically setting keys in the 
# TOML file. To get around this we will make the substitution here
# ahead of invoking the process.
# 

# Works around https://github.com/kelseyhightower/confd/issues/310
sed s#SE_SERVICE_DISCOVERY_KEY#$SE_SERVICE_DISCOVERY_KEY# \
    /etc/confd/conf.d/nginx.toml.template \
    > /etc/confd/conf.d/nginx.toml

sed s#SE_SERVICE_DISCOVERY_KEY#$SE_SERVICE_DISCOVERY_KEY# \
    /etc/confd/templates/nginx.conf.template_orig \
    > /etc/confd/templates/nginx.conf.template

# Okay now we can run confd 
exec nginx -g "daemon off;"
