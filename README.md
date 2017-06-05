[![Build Status](https://travis-ci.org/terencewestphal/docker-minecraft.svg?branch=develop)](https://travis-ci.org/terencewestphal/docker-minecraft) [![Docker Build Statu](https://img.shields.io/docker/build/terencewestphal/minecraft.svg)](https://hub.docker.com/r/terencewestphal/minecraft/builds/) ![Docker Stars](https://img.shields.io/docker/stars/terencewestphal/minecraft.svg) [![Docker Pulls](https://img.shields.io/docker/pulls/terencewestphal/minecraft.svg)](https://hub.docker.com/r/terencewestphal/minecraft/) 

[![Minecraft](https://github.com/terencewestphal/docker-minecraft/blob/master/logo.png?raw=true)](https://minecraft.net/) 
 
# Docker - Minecraft (Vanilla)

- Minimalistic and simple to configure
- Works out-of-the-box. Defaults are provided if no volume is mounted
- Based on the [Official OpenJDK Alpine](https://hub.docker.com/_/openjdk/) image
- Base image for [Minecraft SpongeVanilla](https://hub.docker.com/r/terencewestphal/minecraft-spongevanilla/)

## Supported tags and Dockerfile

- `1.11.2`, `latest` ([Dockerfile](https://raw.githubusercontent.com/terencewestphal/docker-minecraft/1.11.2/Dockerfile))


### Pull  

Get the latest version:
```
docker pull terencewestphal/minecraft:latest
```

Get a specific version:
```
docker pull terencewestphal/minecraft:1.11.2
```

### Build  

Build the latest Minecraft version and tag the image:   
```
docker build -t minecraft .
```

Optional: Build with a specific Minecraft version:   
```
docker build --build-arg VERSION=1.11.2 -t minecraft .
```

### Run
  
Run with default settings:
```
docker run -d -p 25565:25565 --name minecraft terencewestphal/minecraft
```

Run with volume mounted: 
```
docker run -d -p 25565:25565 -v $PWD/defaults:/srv/minecraft --name minecraft terencewestphal/minecraft
```

### Interactive Mode 

Attach an interactive console in order to use the Minecraft server commands:
```
docker attach minecraft
```