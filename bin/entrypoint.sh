#!/bin/bash

# Note: sed -i won't run like this in OS X, but this works in Linux.
# To run in OS X, change this to sed -i '' -e "s|....." format.
sed -i "s|\${REACT_SERVER_CONFIG}|$REACT_SERVER_CONFIG|" /opt/bitnami/nginx/conf/server_blocks/my_server_block.conf

# Load libraries  
. /opt/bitnami/scripts/libbitnami.sh
. /opt/bitnami/scripts/libnginx.sh

# Load NGINX environment variables
eval "$(nginx_env)"

print_welcome_page

if [[ "$*" = "/opt/bitnami/scripts/nginx/run.sh" ]]; then
    info "** Starting NGINX setup **"
    /opt/bitnami/scripts/nginx/setup.sh
    info "** NGINX setup finished! **"
fi

echo ""
exec "$@"