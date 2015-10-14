# Create an Nginx instance that acts as an http load balancer.
FROM stackhub/base-confd
MAINTAINER Boyd Hemphill <boyd@stackengine.com>

#
# Install os packages
#

# Install `haproxy`
RUN \
    apk upgrade && \
    apk update && \
    apk add nginx 

# Laydown config templates
ADD \
    nginx/nginx.toml.template \
    /etc/confd/conf.d/nginx.toml.template

ADD \ 
    nginx/nginx.conf.template_orig \
    /etc/confd/templates/nginx.conf.template_orig

RUN \
    mkdir -pv /etc/sv/nginx && \
    chmod 2775 /etc/sv/nginx && \
    ln -sv /etc/sv/nginx /service

ADD \
    nginx/nginx.sh \
    /etc/sv/nginx/run


ENTRYPOINT ["/sbin/runsvdir", "/service"]
