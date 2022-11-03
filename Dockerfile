# fluentd image based on alpine
FROM fluent/fluentd:v1.7.4-1.0

# Installs several plugins
# Installs curl for container health check

USER root

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev
RUN sudo gem install fluent-plugin-kinesis
RUN sudo gem install fluent-plugin-concat
RUN sudo gem install fluent-plugin-cloudwatch-logs
RUN sudo gem install fluent-plugin-grafana-loki
RUN sudo gem sources --clear-all
RUN apk add curl
RUN apk del .build-deps
RUN rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.4.0/cache/*.gem

COPY fluent.conf /fluentd/etc/
COPY plugins /fluentd/plugins/

USER fluent

