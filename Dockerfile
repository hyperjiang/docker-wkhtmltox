FROM alpine:3.8

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update

# install wkhtmltopdf from `testing` repository
RUN apk add --no-cache qt5-qtbase-dev fontconfig wkhtmltopdf

# install noto fonts
RUN apk add --no-cache zip unzip wget
RUN wget -q -P /tmp/temp/ https://noto-website.storage.googleapis.com/pkgs/Noto-unhinted.zip
RUN mkdir -p /usr/share/fonts/noto \
    && unzip -qq /tmp/temp/Noto-unhinted.zip -d /usr/share/fonts/noto/
RUN fc-cache -fv

# check whether it's installed successfully
RUN wkhtmltopdf --version

# remove temp files
RUN rm -rf /var/cache/apk/* /tmp/temp/
