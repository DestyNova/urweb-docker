FROM ubuntu:19.10
MAINTAINER Oisín Mac Fhearaí

ENV COMPILER=/opt/urweb
ENV COMPILER_SRC=/opt/urweb-src

RUN mkdir -p $COMPILER $COMPILER_SRC
WORKDIR $COMPILER_SRC

# get dependencies
RUN apt-get update -yqq && apt-get install -yqq build-essential wget mlton libssl-dev libpq-dev libmysqlclient-dev libicu-dev git autoconf libtool mime-support libsqlite3-dev

# get Ur/Web from master
RUN git clone https://github.com/urweb/urweb.git urweb

# build Ur/Web from recent safe commit and install in prefix
RUN cd urweb && \
    git checkout b506e44ebbf80d98bb1a39d5566e7cdf53b3fc78 && \
    ./autogen.sh && \
    ./configure --prefix=$COMPILER && \
    make && \
    make install

# clean up
RUN rm -r ${COMPILER_SRC}

ENV URWEB_HOME=${COMPILER}
ENV LD_LIBRARY_PATH=${COMPILER}/lib
ENV PATH=${COMPILER}/bin:${PATH}
