# aria2 with webui
## 项目简介
基于 [ziahamza/webui-aria2](https://github.com/ziahamza/webui-aria2) 原版 webui-aria2 的 docker 镜像.


- GitHub [zxing0214/aria2-withui](https://github.com/zxing0214/aria2-withui)
- Docker [zxing/aria2-withui](https://hub.docker.com/r/zxing/aria2-withui)

## 使用说明
```shell
docker run --restart=always \
        -v /home/<USER>/data/aria2/downloads:/data/downloads \
        -v /home/<USER>/data/aria2/.aria2:/home/aria/.aria2 \
        -p 6800:6800 -p 9100:8080 \
        zxing/aria2-withui \
        --name="aria2-withui" \
        -d
```

## 版本更新
- latest 为最新版
- Tags 为历史版本

## 相关链接
- GitHub [zxing0214/aria2-withui](https://github.com/zxing0214/aria2-withui)
- Docker [zxing/aria2-withui](https://hub.docker.com/r/zxing/aria2-withui)
- 原版 webui-aria2 项目 [ziahamza/webui-aria2](https://github.com/ziahamza/webui-aria2)
