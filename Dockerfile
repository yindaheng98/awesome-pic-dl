FROM python:3-alpine AS base
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
    img2pdf \
    reportlab

FROM base
COPY --from=builder /install /usr/local
RUN apk add --no-cache openjpeg jpeg tiff libxcb