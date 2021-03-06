.PHONY: build
build:
	go build -o inven-order .

.PHONY: docker
docker:
	docker build -t inven-order .

.PHONY: run  
run:
	docker run --name inven-order  --net host -d -p 8282:8282 -e STORE_HOST='127.0.0.1' -e STORE_PORT='8080' inven-order

.PHONY: tag
tag:
	docker tag inven-order:latest renegmedal/inven-order:1.0.1

.PHONY: push
push:
	docker push renegmedal/inven-order:1.0.1

.PHONY: up
up:
	docker-compose up --build -d 
