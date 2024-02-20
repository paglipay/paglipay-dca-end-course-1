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

ssh paul@192.168.0.11
The authenticity of host '192.168.0.11 (192.168.0.11)' can't be established.
ED25519 key fingerprint is SHA256:hS2T8kGdCgOVWz9fzFYDrfPI92MXxXIGecVgFWEdoMY.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.0.11' (ED25519) to the list of known hosts.
paul@192.168.0.11's password:
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.15.0-89-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

180 updates can be applied immediately.
8 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable


The list of available updates is more than a week old.
To check for new updates run: sudo apt update
Last login: Tue Feb 20 07:06:59 2024 from 192.168.0.12
paul@ub-desk-230:~$ docker node ls
ID                            HOSTNAME                            STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
ws5322j0c2lvcjjw57n83oh1w     paul-HP-Compaq-8000-Elite-USDT-PC   Ready     Active         Reachable        20.10.21
xsr5ijr00qb40ja27211ikqra     paul-jetson-nano                    Ready     Active         Leader           20.10.21
ytpcn1xii3ataofajcmf44iot     u6                                  Ready     Active                          20.10.21
ehtus80hvni5789cm05hjf5s9     u7                                  Ready     Active                          20.10.21
nh6y7d6dp89csod0vo044qy7t     u8                                  Ready     Active                          20.10.21
letd3q1nmonkvgnq78ekz4say     u9                                  Ready     Active                          20.10.21
yuczz7oxm7oogpjk7suetofz5 *   ub-desk-230                         Ready     Active         Reachable        20.10.21

docker stack deploy -c docker-compose.yml redis
Creating network redis_default
Creating service redis_redis
paul@ub-desk-230:~/Documents/Projects/paglipay-dca-end-course-1$ docker service ls
ID             NAME                          MODE         REPLICAS   IMAGE                                          PORTS
c5vvk57aysjs   redis_redis                   replicated   3/3        paglipay/redis:latest                          *:6379->6379/tcp

docker service ps redis_redis 
ID             NAME                IMAGE                   NODE          DESIRED STATE   CURRENT STATE            ERROR     PORTS
tpfanx9hd05y   redis_redis.1       paglipay/redis:latest   ub-desk-230   Running         Running 2 minutes ago
7bihf4812z69    \_ redis_redis.1   paglipay/redis:latest   ub-desk-230   Shutdown        Shutdown 2 minutes ago
56y7205pvgwu   redis_redis.2       paglipay/redis:latest   u7            Running         Running 2 minutes ago
zjnatptcrzze    \_ redis_redis.2   paglipay/redis:latest   u7            Shutdown        Shutdown 2 minutes ago
bo5r0zrsyaaq   redis_redis.3       paglipay/redis:latest   u8            Running         Running 2 minutes ago
ilmfatdi3kuz    \_ redis_redis.3   paglipay/redis:latest   u8            Shutdown        Shutdown 2 minutes ago