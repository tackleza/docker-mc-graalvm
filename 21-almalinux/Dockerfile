# Use the official Alpine base image
FROM tackleza/graalvm:21-almalinux

RUN dnf install git nano -y
RUN adduser mc
USER mc
EXPOSE 25565
EXPOSE 25565/udp
WORKDIR /home/mc
