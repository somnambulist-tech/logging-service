FROM docker.elastic.co/beats/filebeat:7.5.2
COPY config/filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml

COPY entrypoint.sh /usr/share/filebeat/entrypoint.sh

ENTRYPOINT /usr/share/filebeat/entrypoint.sh