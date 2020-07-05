# verification_redis_raft
Tools to easily verification RedisRaft with Docker

## how to use 

```bash
git clone git@github.com:bootjp/verification_redis_raft.git
# setup sub module redisraft 
git submodule init
git submodule update
cd redisraft 
# setup redisraft dependency
git submodule init
git submodule update
 
./cluster_setup.bash
```
