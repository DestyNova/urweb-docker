#!/usr/bin/env bash

# Note: I'm giving up on this for now because it needs too much
# of GCC, MLton etc. The image is up to about 350 MB so far and
# doesn't work, so it's probably not worth trying to stuff in
# all the missing pieces just to save a couple of hunded megs
# over the full Ubuntu image.

docker-slim build \
  --http-probe=false \
  --include-path /opt/urweb \
  --include-path /usr/lib \
  --include-bin /bin/sh \
  --include-bin /bin/dash \
  --include-bin /usr/bin/mlton \
  --include-bin /usr/bin/cc \
  --include-bin /usr/bin/gcc \
  --include-bin /usr/bin/ranlib \
  --include-bin /bin/rm \
  --include-bin /usr/bin/ld \
  --include-bin /usr/bin/ldd \
  --include-bin /bin/sleep \
  --include-bin /bin/chmod \
  --include-bin /bin/mkdir \
  --include-path /etc/mime.types \
  --include-shell \
  --cmd urweb urweb
