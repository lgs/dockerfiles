#!/bin/bash
for x in base golang nsq nsqlookupd nsqd ; do
    cd $x
    make
    cd ..
done

