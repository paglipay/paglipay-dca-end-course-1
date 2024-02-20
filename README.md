# paglipay-dca-end-course-1

docker build --pull --rm -f "Dockerfile" -t paglipay/redis:latest "."
docker run --rm -it -p 6379:6379/tcp paglipay/redis:latest 

1:C 20 Feb 2024 16:39:19.800 * oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 20 Feb 2024 16:39:19.800 * Redis version=7.2.4, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 20 Feb 2024 16:39:19.800 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
1:M 20 Feb 2024 16:39:19.802 * monotonic clock: POSIX clock_gettime
                _._
           _.-``__ ''-._
      _.-``    `.  `_.  ''-._           Redis 7.2.4 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 1
  `-._    `-._  `-./  _.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |           https://redis.io
  `-._    `-._`-.__.-'_.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |
  `-._    `-._`-.__.-'_.-'    _.-'
      `-._    `-.__.-'    _.-'
          `-._        _.-'
              `-.__.-'

1:M 20 Feb 2024 16:39:19.824 * Server initialized
1:M 20 Feb 2024 16:39:19.824 * Ready to accept connections tcp


docker image push paglipay/redis:latest
The push refers to repository [docker.io/paglipay/redis]
603c6b6775e1: Pushed
d4fc045c9e3a: Mounted from library/alpine
latest: digest: sha256:59611d225dcd8f637fbdbe1b67d286c2582e390cd7c2ffb383421e4b1e1fe78a size: 739