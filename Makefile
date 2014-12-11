build:
	docker build -t='quay.io/pingles/consul-coreos' .

clean:
	docker rm consul
	
run:
	docker run --name consul -p 8300:8300 \
		-p 8301:8301 \
		-p 8301:8301/udp \
		-p 8302:8302 \
		-p 8302:8302/udp \
		-p 8400:8400 \
		-p 8500:8500 \
		-p 53:53/udp \
		quay.io/pingles/consul-coreos agent -server -config-dir=/config -data-dir=/data -ui-dir=/ui -bootstrap

push:
	docker push quay.io/pingles/consul-coreos

.PHONY: build run