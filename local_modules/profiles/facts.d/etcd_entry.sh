#!/bin/bash

HEALTH=`curl -s -L http://127.0.0.1:2379/health | python -mjson.tool | grep health | awk -F\" '{print $4}'`
if [ "$ETCDHEALTH" == "false" ]; then
    echo "etcd_health=error"
else
    echo "etcd_health=ok"
fi

KEY="/example.com/network/config"
ETCDKEY=`curl -s http://127.0.0.1:2379/v2/keys$KEY | python -mjson.tool | grep key`
if [ ! -z "$ETCDKEY" ]; then
    echo "etcd_key=found"
else
    echo "etcd_key=notfound"
fi
