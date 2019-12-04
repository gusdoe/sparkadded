FROM apache/zeppelin:0.8.1

LABEL maintainer="gus.doh@gmail.com"

ARG SPARK_VERSION="2.4.4"
ARG HADOOP_VERSION="2.7"

LABEL spark.version=${SPARK_VERSION}
LABEL hadoop.version=${HADOOP_VERSION}

ENV SPARK_HOME=/opt/spark
ENV ZEPPELIN_HOME=/zeppelin

ARG SPARK_ARCHIVE=https://www-us.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN mkdir ${SPARK_HOME} &&\
    mkdir /tmp/spark-events    # log-events for spark history server

ENV PATH $PATH:${SPARK_HOME}/bin
RUN curl -s ${SPARK_ARCHIVE} | tar -xz -C  ${SPARK_HOME} --strip-components=1

COPY spark-defaults.conf ${SPARK_HOME}/conf/

EXPOSE 8080


ENTRYPOINT  ${SPARK_HOME}/sbin/start-history-server.sh; ${ZEPPELIN_HOME}/bin/zeppelin-daemon.sh start  && bash
