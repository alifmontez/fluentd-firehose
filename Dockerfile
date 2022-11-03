# fluentd image based on alpine
FROM grafana/fluent-plugin-loki:latest

USER root
RUN apt -y update
RUN apt -y upgrade
RUN apt -y install curl

ADD fluent.conf /fluentd/etc/