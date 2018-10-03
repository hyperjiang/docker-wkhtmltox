# docker-wkhtmltox

Docker image which contains:

- [wkhtmltopdf and wkhtmltoimage](https://github.com/wkhtmltopdf/wkhtmltopdf)

## pull the docker image

```
docker pull hyperjiang/wkhtmltox
```

Current available tags:

- lastest
- 1.0
- 1.0-fonts

## noto fonts

The images with tags {version}-fonts will have noto fonts installed in `/usr/share/fonts/noto`

## usage

```
docker run --rm -v /tmp:/tmp hyperjiang/wkhtmltox:1.0 wkhtmltopdf https://www.google.com/ /tmp/g.pdf
```
