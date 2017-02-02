# docker-shadowsocks-libev
#
# VERSION 0.0.1

FROM pritunl/archlinux
MAINTAINER Sherlock Holo <sherlockya@gmail.com>

RUN pacman -Syu --noconfirm gettext gcc autoconf libtool automake make mbedtls asciidoc xmlto udns libev git libsodium \
&& rm -rf /var/cache/pacman/pkg/*

RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git \
&& cd shadowsocks-libev && git submodule update --init --recursive \
&& ./autogen.sh &&./configure &&make &&make install && cd .. && rm -rf shadowsocks-libev

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/ss-server"]
