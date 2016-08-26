#!/bin/bash

/bin/etcdctl cluster-health > /dev/null 2>&1 && echo "etcd_health=ok" || echo "etcd_health=error"

KEY="/example.com/network/config"
ETCDKEY=`curl -s http://127.0.0.1:2379/v2/keys$KEY | python -mjson.tool | grep key`

if [ ! -z "$ETCDKEY" ]; then
    echo "etcd_key=found"
else
    echo "etcd_key=notfound"
fi
