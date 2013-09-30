default: sync

sync:
	rsync -avP --delete $(PWD)/ root@jp.eeqj.de:dockerfiles/

build:
	./build.sh
