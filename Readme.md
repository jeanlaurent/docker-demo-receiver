# Sample http receiver server written with express for docker demo

## build
`docker build -t jeanlaurent/receiver .`

## run
`docker run -ti -p 9000:9000 jeanlaurent/receiver`

## play with ports
```
> docker run --rm -ti -p 9000 --name receiver jeanlaurent/receiver
> docker inspect receiver | jq '.[0].NetworkSettings.Ports."9000/tcp"[0].HostPort'
> "32773"
> echo 'I know the local port now !' | http post localhost:32773
```
