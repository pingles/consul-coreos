FROM  ubuntu:latest
MAINTAINER Paul Ingles <paul@oobaloo.co.uk>

RUN apt-get update
RUN apt-get install -y unzip

WORKDIR /tmp

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

ENTRYPOINT ["/bin/consul"]
CMD ["agent", "-data-dir=/data", "-config-dir=/config", "-ui-dir=/ui"]