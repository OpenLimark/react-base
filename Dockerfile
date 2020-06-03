FROM bitnami/nginx:1.18
LABEL maintainer="OpenLimark <oss@limarktech.com>"

COPY conf/server.conf.template /opt/bitnami/nginx/conf/server_blocks/my_server_block.conf
COPY bin/entrypoint.sh /bin/entrypoint.sh

ENTRYPOINT [ "/bin/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/nginx/run.sh" ]