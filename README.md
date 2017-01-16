# lumen-docker

## Requirement

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/overview/)

## Installed software:
- Apache 2.4.x 
- PHP 7.0.x
- Lumen 5.3.3

## Installation

Make sure you have `docker` command:

```
$ docker -v
Docker version 1.12.6, build 78d1802
```

Make sure you have `docker-compose` command:

```
$ docker-compose -v
docker-compose version 1.9.0, build 2585387
```

Run install command:

```
$ docker-compose up -d --build
```
This command will start a development server at `http://localhost:8000`