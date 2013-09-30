FROM sneak/golang:1.2rc1
MAINTAINER Jeffrey Paul <sneak@datavibe.net>
RUN mkdir /tmp/build
ENV GOPATH /tmp/build
RUN /bin/bash -l -c 'go get github.com/bitly/go-nsq'
RUN /bin/bash -l -c 'go get github.com/bitly/go-hostpool'
RUN /bin/bash -l -c 'go get github.com/bitly/go-simplejson'
RUN /bin/bash -l -c 'go get github.com/bmizerany/assert'
RUN /bin/bash -l -c 'go get github.com/bitly/nsq' || true
RUN /bin/bash -l -c 'cd /tmp/build/src/github.com/bitly/nsq && ./test.sh'
RUN mv /tmp/build/src/github.com/bitly/nsq/nsqd/nsqd /usr/local/bin
RUN mv /tmp/build/src/github.com/bitly/nsq/nsqadmin/nsqadmin /usr/local/bin
RUN mv /tmp/build/src/github.com/bitly/nsq/nsqlookupd/nsqlookupd /usr/local/bin
RUN mv /tmp/build/src/github.com/bitly/nsq/apps/nsq_pubsub/nsq_pubsub /usr/local/bin
RUN mv /tmp/build/src/github.com/bitly/nsq/apps/nsq_stat/nsq_stat /usr/local/bin
RUN mv /tmp/build/src/github.com/bitly/nsq/apps/nsq_tail/nsq_tail /usr/local/bin
RUN mv /tmp/build/src/github.com/bitly/nsq/apps/nsq_to_file/nsq_to_file /usr/local/bin
RUN mv /tmp/build/src/github.com/bitly/nsq/apps/nsq_to_http/nsq_to_http /usr/local/bin
RUN mv /tmp/build/src/github.com/bitly/nsq/apps/nsq_to_nsq/nsq_to_nsq /usr/local/bin
RUN mv /tmp/build/src/github.com/bitly/nsq/bench/bench_reader/bench_reader /usr/local/bin/nsq_bench_reader
RUN mv /tmp/build/src/github.com/bitly/nsq/bench/bench_writer/bench_writer /usr/local/bin/nsq_bench_writer
RUN rm -rf /tmp/build
