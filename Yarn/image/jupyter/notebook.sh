#!/bin/bash

$SPARK_HOME/bin/pyspark \
    --master yarn \
    --deploy-mode client \
    --conf spark.yarn.appMasterEnv.PYSPARK_PYTHON=/usr/bin/python3 \
    --conf spark.yarn.appMasterEnv.LD_LIBRARY_PATH=/usr/lib/python3.8/site-packages \
    --conf spark.yarn.appMasterEnv.PYSPARK_DRIVER_PYTHON="jupyter" \
    --conf spark.yarn.appMasterEnv.PYSPARK_DRIVER_PYTHON_OPTS="notebook --ip=0.0.0.0 --no-browser --port=8989 --allow-root" \
    --conf spark.executor.extraLibraryPath=/usr/lib/python3.8/site-packages \
    --conf spark.driver.extraLibraryPath=/usr/lib/python3.8/site-packages \
    --conf spark.scheduler.mode="FAIR" \
    --conf spark.scheduler.allocation.file=file://$SPARK_HOME/conf/fairscheduler.xml
