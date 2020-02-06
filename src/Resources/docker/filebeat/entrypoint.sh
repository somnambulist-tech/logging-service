#!/bin/sh

until curl http://kibana:5601/api/status; do 
	>&2 echo "waiting on kibana"
	sleep 1
done

while [ "$(curl http://kibana:5601/api/status)" == "Kibana server is not ready yet" ]; do 
	>&2 echo "waiting on kibana"
	sleep 1
done

#kibana reports ready slightly before the API actually responds to connections
sleep 10

./filebeat -c filebeat.yml -e