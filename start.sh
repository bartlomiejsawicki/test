#!/bin/bash
domain=$1
if [ "$1" == "" ]
then
domain=localhost
fi
openssl req -batch -x509  -nodes -subj "/CN=$domain"  -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
cat key.pem cert.pem > ssl.pem
docker-compose up -d
