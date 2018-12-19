ARG BASE=arm64v8/debian:buster-20181011-slim
FROM ${BASE} as base

COPY qemu-aarch64-static /usr/bin/

RUN set -ex \
    && apt-get update -yq \ 
    && apt-get install -yq \
        build-essential \
        git \
        meson \
        cmake \
        python3 \
        python3-pip \ 
	python3-setuptools \
        libgstreamer1.0-0 \
        gstreamer1.0-plugins-base \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-bad \
        gstreamer1.0-plugins-ugly \
        gstreamer1.0-libav \
        gstreamer1.0-doc \
        gstreamer1.0-tools \ 
        libgstreamermm-1.0-dev \
        libgstreamer-plugins-bad1.0-dev \
        libgstreamer-plugins-base1.0-dev \
        # gstreamer1.0-qt \
        qt5-default \
	qml-module-qtquick-layouts \
	qml-module-qtquick-controls \
	qml-module-qtquick-controls2 \
	qtdeclarative5-dev \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/*


RUN set -ex \
    && pip3 install --upgrade pip wheel setuptools

WORKDIR /src
RUN git clone https://gitlab.freedesktop.org/gstreamer/gst-examples.git

WORKDIR /src/gst-examples/playback/player/qt
RUN qmake
RUN make

WORKDIR /
COPY player.py .
