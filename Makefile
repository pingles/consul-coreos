build:
	docker build -t='quay.io/pingles/consul-coreos' .

push:
	docker push quay.io/pingles/consul-coreos

.PHONY: build