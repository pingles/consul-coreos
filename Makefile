build:
	docker build -t='quay.io/pingles/consul-coreos' .

clean:
	docker rm -f consul
	
run:
	docker run -p 8500:8500 quay.io/pingles/consul-coreos

push:
	docker push quay.io/pingles/consul-coreos

.PHONY: build run