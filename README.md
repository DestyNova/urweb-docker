This repo holds the Dockerfile used to create the base image available at [Docker hub](https://hub.docker.com/r/destynova/urweb) for building Ur/web apps.

You can use it in your own Dockerfiles by extending the base image, like this:

```Dockerfile
FROM destynova/urweb:20190907

ADD src /app/src
ADD css /app/css
WORKDIR /app/src

RUN urweb appname -dbms sqlite -db db.sqlite -output /app/appname.exe
```

For an example of how to do this to build and deploy an Ur/web app on Heroku, check out [memvalid](https://github.com/DestyNova/memvalid), which includes a tiny `heroku.yml` file that controls the build/deploy steps.
