# awesome-pic-dl

🐳A docker image for some awesome picture downloader (image size < 30M).

🐳将一些牛逼的图片下载工具打包成Docker镜像(镜像体积 < 30M)。

View on DockerHub: [yindaheng98/awesome-pic-dl](https://hub.docker.com/repository/docker/yindaheng98/awesome-pic-dl)

已收集的下载工具：

## [hardwarecode/onecomic](https://github.com/hardwarecode/onecomic)

[Supported Sites](https://onecomic-doc.readthedocs.io/en/latest/onecomic-project.html#id1)

[Configuration](https://onecomic-doc.readthedocs.io/en/latest/onecomic-config.html)

## [mikf/gallery-dl](https://github.com/mikf/gallery-dl)

[Supported Sites](https://github.com/mikf/gallery-dl/blob/master/docs/supportedsites.md)

[Configuration](https://github.com/mikf/gallery-dl#configuration)

### Tips

>*gallery-dl* searches for configuration files in the following places:
>
>......
>
>Linux, macOS, etc.:
>    * ``/etc/gallery-dl.conf``
>    * ``${XDG_CONFIG_HOME}/gallery-dl/config.json``
>    * ``${HOME}/.config/gallery-dl/config.json``
>    * ``${HOME}/.gallery-dl.conf``
>
>Values in later configuration files will override previous ones.

I provided a config file in `/etc/gallery-dl.conf` in container: [gallery-dl.config.json](gallery-dl.config.json).

So if you want to overwrite the my config, just mount a config file into `${XDG_CONFIG_HOME}/gallery-dl/config.json` or `${HOME}/.config/gallery-dl/config.json` or `${HOME}/.gallery-dl.conf` in container. For example:

```sh
docker run -v /path/to/your/gallery-dl.conf:/root/.gallery-dl.conf yindaheng98/awesome-pic-dl
```