# Logging Service Skeleton


## Getting started 

Copy the .env.dist to .env

Replace the contents of `src/Resources/docker/filebeat/config/service_list` with a newline delimited list of the docker-compose service names you want dashboards for

The project is pre-configured to capture all stdout and stderr from containers running on the same docker host. So ensure that any containers you want logs for are using stdout/err.

If you are using Traefik the compose file has labels for kibana.example.dev

Once the services are started navigating to Dashboards ![dashboard icon](/docs/dashboard_icon.png) kibana.example.dev/app/kibana#/dashboards should give you a list matching those configured in the service list

## Log tailing

![Logs icon](/docs/logs_icon.png)

The logs section provides a real-time stream of the incoming logs from all services. It can be filted to a specific docker service with the search: `docker.container.labels.com_docker_compose_service: "SERVICENAME"` 

## Discovery 

