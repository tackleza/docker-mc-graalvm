# Use the official Alpine base image
FROM tackleza/graalvm:22-almalinux

RUN dnf install git nano -y
RUN adduser mc
USER mc
EXPOSE 25565
WORKDIR /home/mc
