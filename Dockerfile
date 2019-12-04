FROM apache/zeppelin:0.8.1

ARG SPARK_VERSION="2.4.4"
ARG HADOOP_VERSION="2.7"

LABEL spark.version=${SPARK_VERSION}
LABEL hadoop.version=${HADOOP_VERSION}

ENV SPARK_HOME=/opt/spark
ENV ZEPPELIN_HOME=/zeppelin

ARG SPARK_BINARYTAR=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ARG SPARK_ARCHIVE=https://www-us.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_BINARYTAR}.tgz

RUN wget ${SPARK_ARCHIVE} \
&&  tar -xzf ${SPARK_BINARYTAR}.tgz \
&&  mv ${SPARK_BINARYTAR} ${SPARK_HOME}

EXPOSE 8080

#ENTRYPOINT  ${ZEPPELIN_HOME}/bin/zeppelin-daemon.sh start && bash

