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
  git-backup:
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

上面的程序将 git_volume 卷数据生成一个备份文件 /backup/git.2020-12-18-10-17-31.tar.gz

如果存在 /backup/git.tar.gz 文件，则会自动恢复到 git_volume 卷
