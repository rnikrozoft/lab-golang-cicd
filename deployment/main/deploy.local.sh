#!/bin/bash

export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR

set -ex

TARGET=ubuntu@164.115.45.144
LOCAL_IMAGE=cot/marineapp-cot-backend-golang:latest
REMOTE_IMAGE=164.115.45.144:5000/cot/marineapp-cot-backend-golang:latest

docker tag $LOCAL_IMAGE $REMOTE_IMAGE

docker push $REMOTE_IMAGE

rsync -avzP \
  ./compose.yml \
  ~/_code/marineapp-cot-backend-golang/

cd ~/_code/marineapp-cot-backend-golang
docker compose pull
docker compose up -d