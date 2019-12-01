#!/bin/sh
#
# This is the script you need to provide to launch a redis instance
#
docker build -t gcr.io/green-entity-251200/worker:v1 .
docker push gcr.io/green-entity-251200/worker:v1
#docker run --rm --network network1 -p 8090:8090 gcr.io/green-entity-251200/worker:v1
kubectl create deployment worker --image=gcr.io/green-entity-251200/worker:v1
kubectl expose deployment worker --port 5000 --target-port 5000