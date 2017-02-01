# shadowsocks-libev
#
# VERSION 0.0.1

FROM base/archlinux
MAINTAINER Sherlock Holo <sherlockya@gmail.com>

RUN pacman -S --noconfirm archlinux-keyring

RUN pacman -Syu --noconfirm

RUN pacman -Syu --noconfirm gettext gcc autoconf libtool automake make mbedtls asciidoc xmlto udns libev git

RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git

RUN cd shadowsocks-libev

RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/ss-server"]
