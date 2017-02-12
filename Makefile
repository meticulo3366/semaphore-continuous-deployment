#RUBY_IMAGE:=$(shell head -n 1 Dockerfile | cut -d ' ' -f 2)
IMAGE:=semaphore-continuous-deployment:latest
DOCKER:=tmp/docker

#PATH=$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin/
#alias docker="docker.exe"

.PHONY: check
check:
	docker --version > /dev/null
	ansible --version > /dev/null

Gemfile.lock: Gemfile
	docker run --rm -v $(CURDIR):/data -w /data $(RUBY_IMAGE) \
		bundle package --all

$(DOCKER): Gemfile.lock
	docker build -t $(IMAGE) .
	mkdir -p $(@D)
	touch $@

.PHONY: build
build: $(DOCKER)

.PHONY: test-cloudformation
test-cloudformation:
	aws --region eu-west-1 cloudformation validate-template --template-body file://cloudformation/prereqs.json
	aws --region eu-west-1 cloudformation validate-template --template-body file://cloudformation/app.json

.PHONY: test-image
test-image: $(DOCKER)
	docker run --rm $(IMAGE) \
		ruby $(addprefix -r./,$(wildcard test/*_test.rb)) -e 'exit'

.PHONY: test-ci
test-ci: test-image test-cloudformation

.PHONY: push
push:
	docker tag $(IMAGE) $(UPSTREAM)
	docker push $(UPSTREAM)

.PHONY: clean
clean:
	rm -rf $(DOCKER)
