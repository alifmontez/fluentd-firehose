# fluentd image based on alpine
FROM fluent/fluentd:v1.7.4-1.0

# Installs github.com/awslabs/aws-fluent-plugin-kinesis
# Installs curl for container health check
#
# Other plugins which may be useful:
# For CloudWatch Logs support: github.com/fluent-plugins-nursery/fluent-plugin-cloudwatch-logs
# For multiline logging support: github.com/fluent-plugins-nursery/fluent-plugin-concat
# For parsing docker container log lines that are JSON: https://github.com/edsiper/fluent-plugin-docker

USER root

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
RUN sudo gem install fluent-plugin-kinesis \
RUN sudo gem install fluent-plugin-concat \
RUN sudo gem install fluent-plugin-cloudwatch-logs \
RUN sudo gem install fluent-plugin-grafana-loki \
RUN sudo gem sources --clear-all \
RUN apk add curl \
RUN apk del .build-deps \
RUN rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.4.0/cache/*.gem

COPY fluent.conf /fluentd/etc/
COPY plugins /fluentd/plugins/

USER fluent

