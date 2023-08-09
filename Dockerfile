FROM python:3.9-alpine AS base
FROM base AS builder
WORKDIR /install
RUN apk add \
    build-base \
    openssl \
    bash \
    git \
    sudo \
    freetype-dev \
    fribidi-dev \
    harfbuzz-dev \
    jpeg-dev \
    lcms2-dev \
    openjpeg-dev \
    tcl-dev \
    tiff-dev \
    tk-dev \
    zlib-dev \
    libxml2-dev \
    libxslt-dev \
    qpdf-dev
RUN pip install --prefix /install --no-cache-dir \
    onecomic \
    gallery-dl \
    ex-cd \
    img2pdf \
    reportlab

FROM base
COPY --from=builder /install /usr/local
COPY onecomic.config.ini /etc/onecomic.config.ini
COPY gallery-dl.config.json /etc/gallery-dl.conf
COPY ex-cd.config.json /etc/ex-cd.config.json
COPY entrypoint.sh /entrypoint.sh
RUN apk add --no-cache openjpeg jpeg tiff libxcb ffmpeg && chmod +x /entrypoint.sh
ENV ONECOMIC_CONFIG_FILE="/etc/onecomic.config.ini"
ENTRYPOINT [ "/entrypoint.sh" ]
