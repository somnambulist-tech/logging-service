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

while IFS="" read -r serviceName || [ -n "$serviceName" ]
do
  printf '%s\n' "$serviceName"
  sed "s/SERVICENAME/$serviceName/g" dashboard_template.json > $serviceName.json

  UUID_1=$(cat /proc/sys/kernel/random/uuid)
  UUID_2=$(cat /proc/sys/kernel/random/uuid)
  UUID_3=$(cat /proc/sys/kernel/random/uuid)

  sed -i "s/UUID_1/$UUID_1/g" $serviceName.json
  sed -i "s/UUID_2/$UUID_2/g" $serviceName.json
  sed -i "s/UUID_3/$UUID_3/g" $serviceName.json

  curl -XPOST kibana:5601/api/kibana/dashboards/import -H 'kbn-xsrf:true' -H 'Content-type:application/json' -d @$serviceName.json

done < service_list


./filebeat -c filebeat.yml -e