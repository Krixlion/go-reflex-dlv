# Go-Reflex-Devel

This is the repo for my [docker image](https://hub.docker.com/r/krixlion/go-reflex-dlv) that I use for development of microservices in go.

## Environment variables
BUILD_ARGS - file path \
RUN_ARGS - flags for compiled binary \
DEBUG_PORT - port on which Delve server will run \
DELVE_ARGS - additional flags for Delve to run with 

TESTING - if set to `"true"` then delve will launch in debug tests mode and run tests located in provided filepath \
TEST_PATH - path to the test file

## Mount
Container will read everything from `/app` and that's where you should mount your project root. 

## Examples

### Inside docker-compose.yml 
```docker-compose.yml
services:

  service:
    container_name: debug
    image: krixlion/go-reflex-dlv:1.19.3
    environment:
      - BUILD_ARGS=cmd/main.go
      - RUN_ARGS=-port 8080
      - DEBUG_PORT=2345
      - DELVE_ARGS=--continue
    volumes:
      - .:/app
    ports:
      # Map any port to internal port Delve listens on.
      - 7890:2345
```

### Inside docker-compose.yml in test mode
```docker-compose.yml
services:

  service:
    container_name: debug
    image: krixlion/go-reflex-dlv:1.19.3
    environment:
      - TESTING="yes"
      - TEST_PATH=pkg/hello/hello_test.go
      - DEBUG_PORT=2345
      - DELVE_ARGS=--continue
    volumes:
      - .:/app
    ports:
      # Map any port to internal port Delve listens on.
      - 7890:2345
```
