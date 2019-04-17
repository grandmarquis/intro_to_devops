#!/usr/bin/env bash

docker stop cluster-server
docker container rm cluster-server

rm -f clusterkey*

ssh-keygen -f ./clusterkey -t rsa -N ''

docker build -t cluster-server --build-arg ssh_pub_key="$(cat ./clusterkey.pub)" .


docker run -i -t -d --name cluster-server cluster-server

docker exec -it cluster-server /usr/sbin/sshd

docker exec -it cluster-server netstat-anp

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server

ssh -i clusterkey root@$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server)

# docker exec -it cluster-server /bin/ash
# docker exec -it cluster-server /usr/sbin/sshd
