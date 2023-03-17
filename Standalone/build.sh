#!/bin/bash

export $(cat .env | xargs)

if [ $1 = "up" ];
then

	docker build \
		--build-arg SPARK_VERSION=$SPARK_VERSION \
		--build-arg SPARK_HADOOP_VERSION=$SPARK_HADOOP_VERSION \
		-t spark:$SPARK_VERSION \
		./Standalone/image/base/

	docker compose -f Standalone/docker-compose.standalone.yaml up -d

fi

if [ $1 = "down" ];
then
	docker compose -f Standalone/docker-compose.standalone.yaml down
fi
