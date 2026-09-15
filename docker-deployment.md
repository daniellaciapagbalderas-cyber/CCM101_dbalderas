# Docker Deployment and Container Lifecycle

## Executed Commands and Explanations

1. `docker ps`
   * **Explanation:** This command lists all currently active and running Docker containers on the host system, showing details like container IDs, image names, and port mappings.

2. `docker stop web-server`
   * **Explanation:** This command gracefully shuts down a running container by sending a SIGTERM signal followed by a SIGKILL if it does not stop within the grace period.

3. `docker ps -a`
   * **Explanation:** This command lists all containers on the host system, including those that are currently running, stopped, or exited, allowing you to verify that a container has successfully halted.

4. `docker rm web-server`
   * **Explanation:** This command permanently removes a stopped container configuration and its writeable layer from the host system's memory.
