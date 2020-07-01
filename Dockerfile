FROM redis:6.0-buster

COPY ./redisraft /redisraft

WORKDIR /redisraft

RUN apt update \
    && apt install -y make automake gcc cmake libbsd-dev libtool \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && make

CMD ["redis-server", "--port 5001", "--dbfilename raft.rdb", "--loadmodule /redisraft/redisraft.so", "raft-log-filename=raftlog.db addr=localhost:5001"]