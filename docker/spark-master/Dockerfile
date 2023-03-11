# FROM spark-base:latest

# EXPOSE 8080 7077

# CMD ["${SPARK_HOME}/sbin/start-config.sh;${SPARK_HOME}/sbin/start-master.sh"]

FROM ubuntu:20.04

ARG SPARK_VERSION
ARG SPARK_HADOOP_VERSION

RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/* \
    apt-get install software-properties-common build-essential \
    apt-get install curl python3.8

RUN apt-get update && \
    apt-get upgrade -y
    
RUN apt-get install -y openjdk-8-jdk-headless 

ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"

RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz
    
RUN tar -zxvf spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION} /usr/local/etc/spark && \
    mkdir /usr/local/etc/spark/logs && \
    rm spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz

ENV SPARK_HOME="/usr/local/etc/spark"
ENV SPARK_CONF="${SPARK_HOME}/conf"
ENV PATH="$PATH:${SPARK_HOME}/bin:${SPARK_HOME}/sbin"

# ENV SPARK_MASTER_HOST=${SPARK_MASTER_HOST}
ENV SPARK_MASTER_PORT=7077
ENV SPARK_LOG_DIR="${SPARK_HOME}/logs"
ENV SPARK_PID_DIR="${SPARK_HOME}/tmp"
ENV PYSPARK_PYTHON=/usr/bin/python3 

WORKDIR ${SPARK_HOME}

EXPOSE 7077 8080

CMD ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out
# ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master
