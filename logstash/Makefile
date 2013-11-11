build:
	tar -c . | ssh docker.eeqj.de \
		'cd `mktemp -d` ; tar xvf - ; docker build -rm -t sneak/logstash .'
