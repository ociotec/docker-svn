# docker-svn
Subversion apache docker image

## Build

```
docker build --tag ociotec/svn .
```

## Run

```
docker run --name svn --detach --volume svn-config:/etc/svn --volume svn-repo:/var/lib/svn --publish 8080:80 ociotec/svn
```
