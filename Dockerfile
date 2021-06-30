FROM python:3-alpine AS base
FROM base AS builder
WORKDIR /install
RUN apk add \
    # dev dependencies
    build-base openssl bash git sudo \
    # Pillow dependencies
    freetype-dev fribidi-dev harfbuzz-dev \
    jpeg-dev lcms2-dev  openjpeg-dev \
    tcl-dev tiff-dev tk-dev zlib-dev && \
    python -m venv /opt/venv
RUN pip install --prefix /install --no-cache-dir onecomic gallery-dl

FROM base
COPY --from=builder /install /usr/local
RUN apk add --no-cache openjpeg jpeg tiff libxcb