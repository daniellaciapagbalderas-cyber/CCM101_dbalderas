# Laboratory-06-Cloud-Deployment-Engineer

## Mission Overview

In this mission, I deployed a cloud storage system using Docker Compose. The deployment used Nextcloud as the application and MariaDB as the database. Instead of manually creating each container with separate Docker commands, I used a `docker-compose.yml` file to define and manage the required services.

## Objectives

* Create a multi-container deployment using Docker Compose.
* Deploy Nextcloud as a cloud storage application.
* Configure MariaDB as the database for Nextcloud.
* Use environment variables to configure the containers.
* Understand how containers communicate with each other.
* Start the complete application using Docker Compose.

## Commands Executed

The main commands used during the mission included:

```bash
mkdir nextcloud-deployment
cd nextcloud-deployment
nano docker-compose.yml
docker-compose up -d
docker-compose ps
docker-compose logs
```

The `docker-compose.yml` file was used to define the Nextcloud and MariaDB services and their configuration.

## Skills Learned

Through this mission, I learned how to create a Docker Compose configuration and deploy multiple containers as one application. I learned how service names can be used for communication between containers and how environment variables can be used to configure applications.

I also learned the difference between manually running containers with `docker run` and managing multiple containers with Docker Compose. Most importantly, I learned that Docker Compose makes cloud deployments more organized, repeatable, and easier to manage.
