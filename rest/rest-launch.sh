#!/bin/sh
#
# This is the script you need to provide to launch a redis instance
#
docker build -t gcr.io/green-entity-251200/rest:v1 .
docker push gcr.io/green-entity-251200/rest:v1
#docker run --rm --network network1 -p  7070:7070 gcr.io/green-entity-251200/rest:v1
kubectl create deployment rest --image=gcr.io/green-entity-251200/rest:v1
kubectl expose deployment rest --type=LoadBalancer --port 5000 --target-port 5000