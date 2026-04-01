# mc-graalvm

Docker Hub: https://hub.docker.com/r/tackleza/mc-graalvm

A Minecraft-compatible Docker image powered by GraalVM, built on AlmaLinux. Pre-configured user `mc` (uid/gid 1000) with Git and nano for server management.

## Available Tags

| Tag | GraalVM Version | Description |
|-----|----------------|-------------|
| `17` | GraalVM CE 17 | Java 17 runtime |
| `21` | GraalVM CE 21 | Java 21 runtime |
| `24` | GraalVM CE 24 | Java 24 runtime |
| `25` | GraalVM CE 25 | Java 25 runtime |
| `latest` | GraalVM CE 25 | Same as `25` |

> **Note:** GraalVM versions 22 and 23 are End-of-Life and have been removed.

## Image Details

- **OS:** AlmaLinux
- **User:** `mc` (uid/gid 1000, home `/home/mc`)
- **Exposed port:** `25565` (Minecraft default)
- **Installed tools:** Git, nano

## Usage

### Start an interactive shell

```bash
docker run -it -p 25565:25565 tackleza/mc-graalvm bash
```

### Run with a startup script

```bash
docker run -it -p 25565:25565 tackleza/mc-graalvm bash your_start_script.sh
```

### Run a JAR file

```bash
docker run -it -p 25565:25565 tackleza/mc-graalvm java -jar your_jar.jar
```

### Run Paper/Minecraft server with a data volume

```bash
docker run -it \
  -v ./data:/home/mc \
  -p 25565:25565 \
  tackleza/mc-graalvm java -jar paper.jar
```

### Full example with memory limit and auto-restart

```bash
docker run -d \
  --restart=unless-stopped \
  -v ./data:/home/mc \
  -p 25565:25565 \
  tackleza/mc-graalvm java -Xmx4G -Xms2G -jar paper.jar
```

## Important Notes

- **Mount your data to `/home/mc`** — the container runs as user `mc` and the home directory is `/home/mc`. Always mount a volume to `./data:/home/mc` so your server world and configs persist.
- **Permission:** Ensure your host directory is owned by uid/gid 1000 (`mc:mc`).
- **Port:** The default exposed port is 25565. Remap with `-p 4826:25565` if you need a different host port.
- **Java version output:** By default, running the container without a command will just output the Java version. Override the command to launch your server.

## Installed Tools

| Tool | Purpose |
|------|---------|
| Git | Source code / plugin management |
| nano | Terminal text editor for config files |
