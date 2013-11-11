YYYYMMDD := $(shell date +%Y%m%d)
DIRNAME := $(shell pwd -P)
PKGBASE := $(shell basename $(DIRNAME))
PKGNAME := eeqj/$(PKGBASE):$(YYYYMMDD)

build:
	ssh $(DOCKERHOST) "docker rmi $(PKGNAME)"
	tar -c . | ssh $(DOCKERHOST) \
		'cd `mktemp -d` ; tar xvf - ; docker build -rm -t $(PKGNAME) .'
