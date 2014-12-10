FROM progrium/docker
MAINTAINER Wes Morgan <cap10morgan@gmail.com>

RUN opkg-install bash
ENV SHELL /bin/bash

ADD etcd-bootstrap /bin/etcd-bootstrap

EXPOSE 8400 8500 8600

ENTRYPOINT ["/bin/etcd-bootstrap"]
CMD []
