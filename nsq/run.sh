mkdir /tmp/build
source /etc/profile
export GOPATH=/tmp/build
go get github.com/bitly/go-nsq
go get github.com/bitly/go-hostpool
go get github.com/bitly/go-simplejson
go get github.com/bmizerany/assert
go get github.com/bitly/nsq
S="/tmp/build/src/github.com/bitly/nsq"
sed -i 's/timeout 15s/timeout 30s/;' $S/test.sh
cd $S && ./test.sh
D="/usr/local/bin"
mv $S/nsqd/nsqd $D
mv $S/nsqadmin/nsqadmin $D
mv $S/nsqlookupd/nsqlookupd $D
mv $S/apps/nsq_pubsub/nsq_pubsub $D
mv $S/apps/nsq_stat/nsq_stat $D
mv $S/apps/nsq_tail/nsq_tail $D
mv $S/apps/nsq_to_file/nsq_to_file $D
mv $S/apps/nsq_to_http/nsq_to_http $D
mv $S/apps/nsq_to_nsq/nsq_to_nsq $D
mv $S/bench/bench_reader/bench_reader $D/nsq_bench_reader
mv $S/bench/bench_writer/bench_writer $D/nsq_bench_writer
rm -rf /tmp/build
