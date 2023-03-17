ARG SPARK_VERSION

FROM spark:${SPARK_VERSION}

ENV SPARK_MASTER_PORT=7077

EXPOSE 7077 8080

CMD ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master >> ${SPARK_HOME}/logs/spark-master.out