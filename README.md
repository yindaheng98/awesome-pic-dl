# awesome-pic-dl

ð³A docker image for some awesome picture downloader (image size < 30M).

ð³å°ä¸äºçé¼çå¾çä¸è½½å·¥å·æåæDockeréå(éåä½ç§¯ < 30M)ã

View on DockerHub: [yindaheng98/awesome-pic-dl](https://hub.docker.com/repository/docker/yindaheng98/awesome-pic-dl)

å·²æ¶éçä¸è½½å·¥å·ï¼

## [hardwarecode/onecomic](https://github.com/hardwarecode/onecomic)

[Supported Sites](https://onecomic-doc.readthedocs.io/en/latest/onecomic-project.html#id1)

[Configuration](https://onecomic-doc.readthedocs.io/en/latest/onecomic-config.html)

## [mikf/gallery-dl](https://github.com/mikf/gallery-dl)

[Supported Sites](https://github.com/mikf/gallery-dl/blob/master/docs/supportedsites.md)

[Configuration](https://github.com/mikf/gallery-dl#configuration)

## [yindaheng98/picacomic](https://github.com/yindaheng98/picacomic)

éæåçï¼è¿ä¸å¾å®å

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