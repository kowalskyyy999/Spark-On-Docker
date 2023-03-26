ARG SPARK_VERSION

FROM spark-yarn:${SPARK_VERSION}

RUN pip install jupyter notebook

ENV PYSPARK_DRIVER_PYTHON="jupyter"
ENV PYSPARK_DRIVER_PYTHON_OPTS="notebook --ip=0.0.0.0 --no-browser --port=8989 --allow-root"

ADD notebook.sh ./notebook.sh

RUN chmod a+x ./notebook.sh

EXPOSE 8989 4040 8990 4041

CMD ["./notebook.sh"]
