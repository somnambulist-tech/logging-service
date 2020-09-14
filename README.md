# Logging Service Skeleton

Provides a semi-configured ELK stack for receiving logs to Kibana. This service is intended to be
used with [data-service](https://github.com/somnambulist-tech/data-service-skeleton).

## Getting started 

Create a new repository from the logging-skeleton (easily done from GitHub), or checkout a detached
HEAD from the main repo; or checkout and then remove the .git folder.

Edit the `.env` file to set your preferred docker-compose prefix.

Replace the contents of `config/docker/filebeat/config/service_list` with a newline delimited
list of the docker-compose service names you want dashboards for

The project is pre-configured to capture all stdout and stderr from containers running on the same
docker host. So ensure that any containers you want logs for are using stdout/err. An example [monolog.yaml](/docs/monolog.yaml)

If you are using Traefik the compose file has labels for kibana.example.dev

Once the services are started navigating to Dashboards ![dashboard icon](/docs/dashboard_icon.png) kibana.example.dev/app/kibana#/dashboards
should give you a list matching those configured in the service list

## Log tailing

The logs section ![Logs icon](/docs/logs_icon.png) provides a real-time stream of the incoming logs
from all services. It can be filted to a specific docker service with the search: `docker.container.labels.com_docker_compose_service: "SERVICENAME"` 

## Discovery 

This service is setup to expose Kibana via the data-service traefik instance. Be sure to update
the traefik configuration to reflect your setup.

If you are using [somnambulist/project-manager](https://github.com/somnambulist-tech/project-manager) be sure
to register the logging service in your project config so that it can be started/stopped, inspected
the same as any other managed project.
