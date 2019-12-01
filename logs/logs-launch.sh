#!/bin/sh
#
# This is the script you need to provide to launch a redis instance
#
docker build -t gcr.io/green-entity-251200/logs:v1 .
docker push gcr.io/green-entity-251200/logs:v1
#docker run --rm --network network1 -p  7070:7070 gcr.io/green-entity-251200/rest:v1
kubectl create deployment logs --image=gcr.io/green-entity-251200/logs:v1
kubectl expose deployment logs --port 6000 --target-port 6000