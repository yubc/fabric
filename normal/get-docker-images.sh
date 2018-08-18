#!/bin/bash -eu


DOCKER_NS=hyperledger
ARCH=x86_64
VERSION=1.1.1
BASE_DOCKER_TAG=x86_64-0.4.6

FABRIC_IMAGES=(fabric-peer fabric-orderer fabric-ccenv fabric-javaenv  \
fabric-tools)

FABRIC_BASE=(fabric-baseos fabric-baseimage)

FABRIC_KAFKA=(fabric-kafka fabric-zookeeper fabric-couchdb)

for image in ${FABRIC_IMAGES[@]}
do
  echo "Pulling ${DOCKER_NS}/$image:${ARCH}-${VERSION}"
  docker pull ${DOCKER_NS}/$image:${ARCH}-${VERSION}
  docker tag ${DOCKER_NS}/$image:${ARCH}-${VERSION}  ${DOCKER_NS}/$image:latest
done

for image in ${FABRIC_KAFKA[@]}
do
  echo "Pulling ${DOCKER_NS}/$image:latest"
  docker pull ${DOCKER_NS}/$image
done

for base in ${FABRIC_BASE[@]}
do
  echo "Pulling ${DOCKER_NS}/$base:${BASE_DOCKER_TAG}"
  docker pull ${DOCKER_NS}/$base:${BASE_DOCKER_TAG}
done