FROM ubuntu:20.04
MAINTAINER Oisín Mac Fhearaí

ARG URWEB_COMMIT=master
ARG COMPILER=/opt/urweb
ARG COMPILER_SRC=/opt/urweb-src

RUN mkdir -p $COMPILER $COMPILER_SRC
WORKDIR $COMPILER_SRC

# Select a timezone to stop tzdata hanging the build. Change this as needed.
ENV TZ=Europe/Dublin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# Get dependencies
RUN apt-get update -yqq && apt-get install -yqq build-essential wget mlton libssl-dev libpq-dev libmysqlclient-dev libicu-dev git autoconf libtool mime-support libsqlite3-dev

# Get Ur/Web from master
RUN git clone https://github.com/urweb/urweb.git urweb

# Build Ur/Web from either master or named commit and install in prefix
RUN cd urweb && \
    git checkout $URWEB_COMMIT && \
    ./autogen.sh && \
    ./configure --prefix=$COMPILER && \
    make && \
    make install

# Clean up
RUN rm -r ${COMPILER_SRC}

ENV URWEB_HOME=${COMPILER}
ENV LD_LIBRARY_PATH=${COMPILER}/lib
ENV PATH=${COMPILER}/bin:${PATH}
