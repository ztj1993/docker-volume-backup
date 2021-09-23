# Docker Volume 自动备份及恢复

这是一个针对单机 Docker 的 Volume 自动恢复程序。

### 环境变量
- alias：当前你备份的别名
- volume：将要备份的卷
- backup：放置备份文件的卷

### 使用方式
参考：
```
docker volume create --name vbt-volume
docker run -v vbt-volume:/volume alpine:latest touch /volume/a.txt
docker run -d -v vbt-volume:/volume alpine:latest sleep 10000

docker-compose -f docker-compose.example.yml up -d
docker-compose -f docker-compose.batch.yml up -d
```
