FROM eeqj/base:20131111

ADD http://www.rabbitmq.com/rabbitmq-signing-key-public.asc /tmp/key.asc
RUN apt-key add /tmp/key.asc
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > \
    /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get update
RUN apt-get install -y rabbitmq-server
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management

EXPOSE 5672 15672

ENTRYPOINT ["/usr/sbin/rabbitmq-server"]
