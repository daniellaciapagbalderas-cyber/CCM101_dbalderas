# Docker Compose Guide

## What does the `services:` block do?

The `services:` block defines the containers that will be created and managed by Docker Compose. In our project, we have two main services: the **database** and the **Nextcloud app**.

The database service uses the MariaDB image and stores the information needed by Nextcloud. The Nextcloud service runs the Nextcloud application itself. Docker Compose allows these services to be started together using one command.

For example:

```yaml
services:
  database:
    image: mariadb:10.6

  nextcloud:
    image: nextcloud
```

Each service has its own configuration, such as the Docker image, environment variables, ports, volumes, and dependencies.

## How does the Nextcloud container find the database container?

The Nextcloud container uses the `MYSQL_HOST` environment variable to identify the database container.

For example:

```yaml
environment:
  - MYSQL_HOST=database
```

The value `database` is the name of the database service in the Compose file. Docker Compose automatically creates a network for the services, allowing containers to communicate using their service names.

Therefore, Nextcloud does not need the database container's IP address. It can simply connect to the host named `database`.

This makes the deployment easier because Docker handles the internal networking between the containers.

## Difference Between `docker run` and `docker-compose up -d`

The `docker run` command is normally used to create and start one Docker container at a time. For example:

```bash
docker run -d --name minio-server ...
```

This means that the configuration for the container must be provided directly in the command. If an application requires several containers, many commands may be needed.

`docker-compose up -d` works differently. It reads the configuration from the `docker-compose.yml` file and creates and starts all the services defined there.

The `-d` option means **detached mode**, so the containers continue running in the background while the terminal is available for other commands.

Using Docker Compose is more convenient for multi-container applications because the complete configuration is stored in one file. This makes the deployment easier to repeat, understand, and maintain.
