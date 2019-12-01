#!/bin/sh
#
# This is the script you need to provide to launch a rabbitmq instance
# service
#
docker run -d --hostname rabbitmq --name rabbitmq --network network1 -e RABBITMQ_ERLANG_COOKIE='secret cookie here' rabbitmq:3
kubectl create deployment rabbitmq --image=rabbitmq
kubectl expose deployment rabbitmq  --port 5672 --target-port 5672