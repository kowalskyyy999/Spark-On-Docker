ARG SPARK_VERSION

FROM spark-yarn:${SPARK_VERSION}

EXPOSE 7077 8080

CMD ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master >> ${SPARK_HOME}/logs/spark-master.out