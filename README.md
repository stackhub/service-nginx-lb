# Purpose

This repo contains the processes necessary to build a dynamic nginx container
that acts as a load balancer to http backends.

# Overview

Conceptually, this container is meant to be balance *n* number of backend
http services.  While these will typically be other nginx services 
(e.g. [nginx-backend-eg](http://github.com/stackhub/nginx-backend-eg)) this 
is not required.

For example, starting this container to balance *n* number of apache `httpd` 
containers (e.g. 
[apache-backend-eg](http://github.com/stackhub/apache-backend-eg)) or a 
golang binary that servers and http api.  

# Usage

For example usage, please see the 
[stack-nginx-lb repo](http://github.com/stackhub/stack-nginx-lb).

# License

MIT
