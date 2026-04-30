.PHONY: build run stop

REPO = fredblgr/ubuntu-xampp
TAG  = 2026
CONTAINER = ubuntu-xampp-test

build:
	docker build --platform linux/x86_64 -t $(REPO):$(TAG) .
	@danglingimages=$$(docker images --filter "dangling=true" -q); \
	if [[ $$danglingimages != "" ]]; then \
	  docker rmi $$(docker images --filter "dangling=true" -q); \
	fi

run:
	docker run --rm -d \
	  --platform linux/x86_64 \
	  -p 80:80 -p 443:443 \
		-v ${PWD}:/opt/lampp/htdocs:rw \
		--name $(CONTAINER) \
		$(REPO):$(TAG)
	sleep 1
	open "http://localhost" || xdg-open "http://localhost" || echo "http://localhost"

stop:
	docker stop $(CONTAINER)

login:
	docker login --username fredblgr https://index.docker.io

push:
	docker push $(REPO):$(TAG)
