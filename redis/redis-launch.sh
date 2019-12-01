#!/bin/sh
#
# This is the script you need to provide to launch a redis instance
# and and service
#
docker run --net network1 -d --name redis redis
docker run -it --network network1 --rm redis redis-cli -h redis
kubectl create deployment redis --image=redis
kubectl expose deployment redis --port 6379 --target-port 6379
