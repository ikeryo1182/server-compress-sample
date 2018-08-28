FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git wget build-essential
RUN wget https://cmake.org/files/v3.9/cmake-3.9.1.tar.gz \
    && tar xvf cmake-3.9.1.tar.gz \
    && cd cmake-3.9.1 \
    && ./configure \
    && make \
    && make install \
    && export PATH="/usr/local/bin:$PATH" \
    && cmake
RUN git clone https://github.com/google/brotli.git \
    && cd brotli/ \
    && mkdir out && cd out \
    && ../configure-cmake \
    && make \
    && make test \
    && make install

RUN wget http://ftp.kddilabs.jp/infosystems/apache//httpd/httpd-2.4.34.tar.bz2 \
    && ./configure --with-ssl --with-mpm=prefork --enable-rewrite --with-brotli=/usr/local \
    && make \
    && make install \
    && echo /usr/local/lib > /etc/ld.so.conf.d/usr-local-lib.conf \
    && ldconfig 

COPY ./src /var/www/html
COPY ./config/httpd.conf /usr/local/apache2/conf/httpd.conf 

EXPOSE 80
