# fluentd image based on alpine
FROM grafana/fluent-plugin-loki:latest

USER root
RUN sudo apt -y install curl

ADD fluent.conf /fluentd/etc/