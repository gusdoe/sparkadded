FROM apache/zeppelin:0.8.2

RUN wget https://www-us.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz \
&&  tar -xzf spark-2.4.4-bin-hadoop2.7.tgz \
&&  mv spark-2.4.4-bin-hadoop2.7 /opt/spark

ENV SPARK_HOME=/opt/spark

EXPOSE 8080