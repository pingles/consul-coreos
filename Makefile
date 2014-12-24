build:
	docker build -t='pingles/consul-coreos' .

clean:
	docker rm -f consul
	
run:
	docker run -p 8500:8500 pingles/consul-coreos

.PHONY: build run