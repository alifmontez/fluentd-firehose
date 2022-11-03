# fluentd image based on alpine
FROM grafana/fluent-plugin-loki:latest

ADD fluent.conf /fluentd/etc/