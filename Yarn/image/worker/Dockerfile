ARG SPARK_VERSION

FROM spark-yarn:${SPARK_VERSION}

EXPOSE 8081

CMD ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> ${SPARK_HOME}/logs/spark-worker.out