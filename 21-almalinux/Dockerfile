# Use the official Alpine base image
FROM tackleza/graalvm:21-almalinux

RUN dnf install git nano -y
RUN adduser mc

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 25565
EXPOSE 25565/udp
WORKDIR /home/mc
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
