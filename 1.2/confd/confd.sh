#!/bin/sh
# confd does not yet allow for dynamically setting keys in the 
# TOML file. To get around this we will make the substitution here
# ahead of invoking the process.
# 
# Works around https://github.com/kelseyhightower/confd/issues/310
sed s#STACKENGINE_BACKEND_KEY#$STACKENGINE_BACKEND_KEY# /etc/confd/conf.d/nginx.toml.template > /etc/confd/conf.d/nginx.toml

# Okay now we can run confd 
exec /usr/bin/confd -backend stackengine -node $STACKENGINE_LEADER_IP:8443 -scheme https -auth-token $STACKENGINE_API_TOKEN -interval 5
