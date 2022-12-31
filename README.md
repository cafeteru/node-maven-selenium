# Node Maven Selenium Image

[![Docker Pulls](https://img.shields.io/docker/pulls/cafeteru/node-maven-selenium.svg)](https://hub.docker.com/r/cafeteru/node-maven-selenium/)

This repository is used to create a custom image for Docker with:

- Maven Version: 3.8.6-jdk-11
- Nodejs Version: v18
- Chromium Version: 108.0.5359.71

## Generate local image

```shell
docker build -t node-maven-selenium . --progress=plain
```

## Create local tag

```shell
docker tag node-maven-selenium node-maven-selenium:latest
```

## Publish the image to Docker Hub

```shell
docker push cafeteru/localize-me-backend:latest
```
