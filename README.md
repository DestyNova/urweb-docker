# Overview

This repo holds the Dockerfile used to create the base image available at [Docker hub](https://hub.docker.com/r/destynova/urweb) for building [Ur/web](http://www.impredicative.com/ur/) apps.

# Using the image

You can use it in your own Dockerfiles by extending the base image, like this:

```Dockerfile
FROM destynova/urweb:20210919

ADD src /app/src
ADD css /app/css
WORKDIR /app/src

RUN urweb appname -dbms sqlite -db db.sqlite -output /app/appname.exe
```

For an example of how to do this to build and deploy an Ur/web app on [Render](https://render.com), check out [memvalid](https://github.com/DestyNova/memvalid), whose `Dockerfile` builds and launches the app on the default Render webapp port 10000.

# Building a new base image

The `build-and-push.sh` script is used to build and push an Ur/web base image. By default, it will check out the latest HEAD of the upstream master branch. If you don't want that, you can select a specific known-good commit hash to build from by adding the following argument to the `docker build` command in the build script:

```
--build-arg URWEB_COMMIT=<commit SHA hash>
```

Note that the `IMAGE_TAG` option will also need to be changed so that the image can be pushed to Docker Hub.
