# Mission Reflection

Writing a `docker-compose.yml` file makes a cloud engineer's job easier because it allows the configuration of an entire application to be written in one file. Instead of manually typing several Docker commands every time, I can use one command such as `docker-compose up -d` to start all the required containers. It also makes the deployment easier to repeat because the same configuration can be used again on another machine.

YAML indentation is very important because YAML uses spaces and indentation to understand the structure of the configuration. If I accidentally use a Tab instead of spaces or use the wrong indentation, Docker Compose may not be able to read the file correctly. This can result in an error when trying to start the services. This taught me that even a small formatting mistake can prevent a deployment from working.

We used environment variables such as `MYSQL_PASSWORD` because they allow important configuration values to be passed to the containers without putting them directly into the application commands. Environment variables also make the configuration easier to change. For example, database passwords or usernames can be updated without changing the entire Compose structure.

Deploying Nextcloud felt impressive because a fully functional enterprise cloud storage system could be running within only a few minutes. Before this activity, setting up a system like this seemed more complicated. Docker made it possible to combine the application and database into containers and manage them together.

Since Mission 1, my understanding of Cloud Computing has evolved significantly. I now understand that cloud computing is not only about storing files online or using remote servers. It also involves virtualization, containers, networking, databases, automation, and deployment tools. This mission helped me understand how cloud engineers can use tools like Docker and Docker Compose to deploy applications efficiently and consistently.
