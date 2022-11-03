# fluentd image based on alpine
FROM grafana/fluent-plugin-loki:latest

USER root
RUN apk --no-cache add curl

ADD fluent.conf /fluentd/etc/