#!/bin/sh
apt-get update
apt-get install -y python3 python3-pip git
pip3 install requests
pip3 install jsonpickle
pip3 install pika
echo jsonpickle
pip3 install pillow
pip3 install redis
python3 -u /logs/logs-client.py rest.rest.debug rest.rest.logs worker.worker.debug worker.worker.logs