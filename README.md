# Sample http receiver server written with express for docker demo

This starts a sample http server outputing to stdout anything which is in the body of a `post` on the root of the server.

## build ...
`docker build -t jeanlaurent/receiver .`

## ... or pull
`docker pull jeanlaurent/receiver`

## run
`docker run -ti -p 9000:9000 jeanlaurent/receiver`

## play with ports
run with auto port allocation `docker run --rm -ti -p 9000 --name receiver jeanlaurent/receiver`

send retrieve and query properly
```
> docker inspect receiver | jq -r '.[0].NetworkSettings.Ports."9000/tcp"[0].HostPort'
> 32773
> echo 'I know the local port now !' | http post localhost:32773
```

or with a one liner cowboys style to "impress" friends

`echo 'I know the local port now !' | http post $(docker-machine ip default):$(docker inspect receiver | jq -r '.[0].NetworkSettings.Ports."9000/tcp"[0].HostPort')`
