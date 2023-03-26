#!/bin/bash
. ./.env

if [ $1 = "up" ];
then

	docker build \
		--build-arg SPARK_VERSION=$SPARK_VERSION \
		--build-arg SPARK_HADOOP_VERSION=$SPARK_HADOOP_VERSION \
        --build-arg HADOOP_VERSION=$HADOOP_VERSION \
		-t spark-yarn:$SPARK_VERSION \
		./Yarn/image/base/

	docker compose -f Yarn/docker-compose.yarn.yaml up -d

fi

if [ $1 = "down" ];
then
	docker compose -f Yarn/docker-compose.yarn.yaml down
fi
