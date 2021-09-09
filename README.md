# Docker Volume 自动备份及恢复

这是一个针对单机 Docker 的 Volume 自动恢复程序。

### 环境变量
- alias：当前你备份的别名
- volume：将要备份的卷
- backup：放置备份文件的卷

### 使用方式
```
version: "3"
services:
  backup:
    image: ztj1993/volume-backup:latest
    privileged: true
    environment:
      - alias=git
      - volume=git_volume
      - backup=git_backup
    volumes:
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
```

上面的程序将 git_volume 卷数据生成一个备份文件 git.{时间}.tar.gz 放入 git_backup 卷中。

如果存在 /backup/git.tar.gz 文件，则会自动恢复到 git_volume 卷

### 批量使用
```
version: "3"
services:
  batch:
    image: ztj1993/volume-backup:latest
    command: batch
    privileged: true
    environment:
      - backup=/backup
      - batch_01=git:git_volume
      - batch_02=mysql:mysql_volume
    volumes:
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
```
