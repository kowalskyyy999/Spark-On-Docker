ARG HADOOP_VERSION

FROM resourcemanager:${HADOOP_VERSION}

RUN apt-get clean

ENV TZ="Asia/Jakarta"

ARG SPARK_VERSION
ARG SPARK_HADOOP_VERSION

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
ENV PATH="$PATH:${SPARK_HOME}/bin:${SPARK_HOME}/sbin"

ENV SPARK_CONF_DIR="${SPARK_HOME}/conf"
ENV HADOOP_CONF_DIR="${HADOOP_HOME}/etc/hadoop"
ENV YARN_CONF_DIR="${HADOOP_HOME}/etc/hadoop"
ENV SPARK_LOG_DIR="${SPARK_HOME}/logs"
ENV SPARK_PID_DIR="${SPARK_HOME}/tmp"
ENV PYSPARK_PYTHON=/usr/bin/python3
ENV SPARK_MASTER_PORT=7077

COPY spark-conf/spark-defaults.conf ${SPARK_HOME}/conf/spark-defaults.conf
COPY spark-conf/*.xml ${SPARK_HOME}/conf/
COPY yarn-conf/yarn-site.xml ${HADOOP_CONF_DIR}/yarn-site.xml
COPY yarn-conf/*.xml ${HADOOP_CONF_DIR}/

RUN cp ${SPARK_HOME}/yarn/spark-3.2.2-yarn-shuffle.jar $HADOOP_HOME/share/hadoop/yarn/spark-3.2.2-yarn-shuffle.jar 

RUN cp ${SPARK_HOME}/conf/fairscheduler.xml.template ${SPARK_HOME}/conf/fairscheduler.xml

RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j_8.0.32-1ubuntu20.04_all.deb

RUN dpkg -i mysql-connector-j_8.0.32-1ubuntu20.04_all.deb

RUN ln -s /usr/share/java/mysql-connector-j-8.0.32.jar ${SPARK_HOME}/jars/mysql-connector-java.jar

WORKDIR ${SPARK_HOME}

CMD source ~/.bashrc
