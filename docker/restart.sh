#!/bin/sh

docker stop detr_dev
docker rm detr_dev
docker run -d \
  --shm-size 10g \
  --restart=always \
  --gpus 'all,"capabilities=compute,video,graphics,utility"' \
  --name detr_dev \
  -p 2229:22 \
  -v /data:/data \
  -v /code:/code \
  detr_dev \
  /my_entry.sh
