default: sync

sync:
	rsync -avP --delete $(PWD)/ root@jp.eeqj.de:dockerfiles/

build:
	./build.sh

visualize:
	$(eval TEMPD := $(shell mktemp -d -t XXXXX))
	cd $(TEMPD) && \
		ssh $(DOCKERHOST) "docker images -viz" | dot -Tpdf -o x.pdf && \
		open x.pdf
