FROM launcher.gcr.io/google/debian9:latest

# build wkhtmltox
ENV WKHTMLTOX_VER 0.12.5

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends build-essential wget

RUN wget -q -P /tmp/temp/ https://downloads.wkhtmltopdf.org/0.12/${WKHTMLTOX_VER}/wkhtmltox_${WKHTMLTOX_VER}-1.stretch_amd64.deb

RUN apt-get install -y ca-certificates libxrender1 libxt6 libxtst6 fontconfig xfonts-75dpi xfonts-base libjpeg62-turbo
RUN dpkg -i /tmp/temp/wkhtmltox_${WKHTMLTOX_VER}-1.stretch_amd64.deb > /dev/null

# install noto fonts
RUN apt-get install -y locales-all zip unzip
RUN wget -q -P /tmp/temp/ https://noto-website.storage.googleapis.com/pkgs/Noto-unhinted.zip
RUN mkdir -p /usr/share/fonts/noto \
    && unzip -qq /tmp/temp/Noto-unhinted.zip -d /usr/share/fonts/noto/
RUN fc-cache -fv

# clean up temp files
RUN rm -rf /var/lib/apt/lists/* /tmp/temp/

# check whether it's installed successfully
RUN wkhtmltopdf --version
