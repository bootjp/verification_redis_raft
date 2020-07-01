#!/usr/bin/env bash

set -eu

echo "start container"

docker-compose up -d

echo "waiting container start"
for i in {1..5}; do
    printf "."
    sleep 1
done
echo

echo "setup raft cluster"
docker-compose exec redisreft01 redis-cli -p 5001 raft.cluster init
docker-compose exec redisreft02 redis-cli -p 5001 RAFT.CLUSTER JOIN redisreft01:5001
docker-compose exec redisreft03 redis-cli -p 5001 RAFT.CLUSTER JOIN redisreft01:5001

echo "show raft cluster infomation"
docker-compose exec redisreft01 redis-cli -p 5001 --raw RAFT.INFO