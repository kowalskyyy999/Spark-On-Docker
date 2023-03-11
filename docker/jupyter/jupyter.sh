#!/bin/bash

$SPARK_HOME/bin/pyspark \
    --master spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT}