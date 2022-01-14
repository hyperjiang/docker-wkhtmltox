# docker-wkhtmltox

Docker image which contains:

- [wkhtmltopdf and wkhtmltoimage](https://github.com/wkhtmltopdf/wkhtmltopdf)

## pull the docker image

```
docker pull registry.cn-hangzhou.aliyuncs.com/huolala/wkhtmltox:1.0
```

## noto fonts

The images with tags {version}-fonts will have noto fonts installed in `/usr/share/fonts/noto`

## usage

```
docker run --rm -v /tmp:/tmp registry.cn-hangzhou.aliyuncs.com/huolala/wkhtmltox:1.0 wkhtmltopdf https://www.google.com/ /tmp/g.pdf
```
