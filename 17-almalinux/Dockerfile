# Use the official Alpine base image
FROM tackleza/graalvm:17-almalinux

RUN dnf install git -y
RUN adduser mc
USER mc
EXPOSE 25565
WORKDIR /home/mc
