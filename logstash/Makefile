build:
	tar -c . | ssh $(DOCKERHOST) \
		'cd `mktemp -d` ; tar xvf - ; docker build -rm -t sneak/logstash .'
