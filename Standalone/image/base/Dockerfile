FROM ubuntu:20.04

ARG SPARK_VERSION
ARG SPARK_HADOOP_VERSION

RUN apt-get clean

ENV TZ="America/New_York"

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl wget software-properties-common python3.8 python3-pip python3-venv

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y openjdk-8-jdk-headless

ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"

RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz

RUN tar -zxvf spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION} /usr/local/etc/spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION} && \
    mkdir /usr/local/etc/spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}/logs && \
    rm spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz

ENV SPARK_HOME=/usr/local/etc/spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}
ENV SPARK_CONF="${SPARK_HOME}/conf"
ENV PATH="$PATH:${SPARK_HOME}/bin:${SPARK_HOME}/sbin"

ENV SPARK_MASTER_PORT=7077
ENV SPARK_LOG_DIR="${SPARK_HOME}/logs"
ENV SPARK_PID_DIR="${SPARK_HOME}/tmp"
ENV PYSPARK_PYTHON=/usr/bin/python3 

WORKDIR ${SPARK_HOME}

CMD source ~/.bashrc