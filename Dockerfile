FROM  ubuntu:latest
MAINTAINER Paul Ingles <paul@oobaloo.co.uk>

RUN apt-get update
RUN apt-get install -y unzip

WORKDIR /tmp

ADD https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz /tmp/etcd.tar.gz
RUN tar zxvf etcd.tar.gz
RUN mv ./etcd-v0.4.6-linux-amd64/etcdctl /bin/etcdctl

ADD https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip /tmp/consul.zip
RUN unzip consul.zip
RUN chmod +x consul
RUN mv consul /bin/consul
RUN rm consul.zip

ADD https://dl.bintray.com/mitchellh/consul/0.4.1_web_ui.zip /tmp/webui.zip
RUN unzip webui.zip
RUN mv dist /ui
RUN rm webui.zip

ADD ./config /config

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp
VOLUME ["/data"]

ENV SHELL /bin/bash

ADD ./start-consul-service /bin/start-consul-service

ENTRYPOINT ["/bin/start-consul-service"]
CMD []