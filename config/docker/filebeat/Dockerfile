ARG ELK_VERSION

FROM docker.elastic.co/beats/filebeat:${ELK_VERSION}
COPY config/filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml

COPY entrypoint.sh /usr/share/filebeat/entrypoint.sh
COPY config/service_list /usr/share/filebeat/service_list
COPY config/dashboard_template.json /usr/share/filebeat/dashboard_template.json

ENTRYPOINT /usr/share/filebeat/entrypoint.sh