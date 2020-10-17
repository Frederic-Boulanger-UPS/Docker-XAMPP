.PHONY: build run stop

REPO = fredblgr/ubuntu-xampp
TAG  = 2020
CONTAINER = ubuntu-xampp-test

build:
	docker build -t $(REPO):$(TAG) .
	docker rmi $$(docker images --filter "dangling=true" -q)

run:
	docker run --rm -d \
	  -p 80:80 -p 443:443 \
		-v ${PWD}:/opt/lampp/htdocs:rw \
		--name $(CONTAINER) \
		$(REPO):$(TAG)
	sleep 1
	open "http://localhost" || xdg-open "http://localhost" || echo "http://localhost"

stop:
	docker stop $(CONTAINER)
