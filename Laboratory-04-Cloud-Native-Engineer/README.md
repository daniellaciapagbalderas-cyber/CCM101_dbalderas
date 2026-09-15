
# Laboratory 4: The Cloud-Native Engineer

## Mission Overview
As part of the CloudNova Technologies Cloud-Native Engineering Team, this laboratory activity focuses on transitioning from traditional infrastructure virtualization to modern containerization practices. The objective is to understand the core differences between Virtual Machines and containers, run core Docker commands, and deploy an Nginx web server using the KillerCoda interactive playground environment.

## Objectives
* Differentiate between traditional Virtual Machines (VMs) and Containers.
* Access a Docker-enabled cloud environment using KillerCoda.
* Execute fundamental Docker CLI (Command Line Interface) commands.
* Pull, run, manage, and terminate a containerized application (Nginx).
* Create professional technical documentation of container operations using Markdown.
* Continue developing a well-organized GitHub Cloud Computing Portfolio.

## Docker Commands Executed
* `docker --version` & `docker info` — Verified the local installation status and runtime details of Docker.
* `docker pull nginx` — Downloaded the official Nginx web server image from the Docker Hub registry.
* `docker run -d -p 8080:80 --name web-server nginx` — Ran an Nginx container in detached mode, mapping host port 8080 to container port 80.
* `curl http://localhost:8080` — Dispatched a local HTTP request to confirm the Nginx server successfully returns its default welcome webpage.
* `docker ps` — Listed all actively running Docker containers.
* `docker stop web-server` — Commanded the active Nginx container to stop its execution.
* `docker ps -a` — Inspected all containers to verify that the Nginx instance reached an exited status.
* `docker rm web-server` — Deleted the stopped Nginx container configuration entirely from the local system.

## Skills Learned
* Architectural differentiation between hypervisor-managed virtual machines and kernel-shared container environments.
* Hands-on proficiency with the core Docker CLI lifestyle cycle toolsets (pull, run, stop, rm).
* Implementation of host-to-container port mapping rules to securely route external network traffic.
* Programmatic testing of headless web instances using command-line diagnostic utilities like curl.

## Challenges Encountered
* **Port Availability Tracking:** Ensured that host port 8080 was entirely clear of competing local services before executing the daemon mapping sequence to avoid binding conflicts.
* **Terminal Management:** Navigating detached standard outputs requires robust usage of logs and process inspections (`docker ps`) to verify application status without an attached terminal stdout stream.
