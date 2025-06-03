## This was build base on my image (tackleza/graalvm)

Docker Hub: https://hub.docker.com/r/tackleza/mc-graalvm

### Purpose of this images is pre-created user "mc" and expose port 25565

- In this docker template I've create new user called "mc" and the WORKDIR is in /home/mc
- So please make sure that you mount the dir correctly
- Please make sure that you have valid permission *uid=1000(mc) gid=1000(mc) groups=1000(mc)*
- By default. if you run this container. It'll output only java version (java-version). So don't forget to override the command

## Please note
This container run as user `mc`. The working Dir (Home dir) is `/home/mc` so please make sure that you mount your app to valid path. Example below

## How to use this image

### Run this container as bash (Terminal)
    docker run -it -p 25565:25565 tackleza/mc-graalvm bash
### Run this container with your startup script
    docker run -it -p 25565:25565 tackleza/mc-graalvm bash your_start_script.sh
### Run this container with your java .jar file
    docker run -it -p 25565:25565 tackleza/mc-graalvm java -jar your_jar.jar
### Run this container with papermc.jar (more example)
    docker run -it -v ./data:/home/mc -p 25565:25565 tackleza/mc-graalvm java -jar paper.jar
### Run this container with auto restart, mount the data to host directory, with java runtime args
    docker run -it --restart=unless-stopped -v ./data:/home/mc -p 25565:25565 tackleza/mc-graalvm java -Xmx4G -jar paper.jar

### Notes

- *You can "-v" mount directory as you need*
- *You can use --restart=unless-stopped for auto restart if your application crash*
- *You can change the port to something else like -p 4826:25565* In this case, it's will expose port to your host as port 4826

### Additional Installed Tools
- git
- nano