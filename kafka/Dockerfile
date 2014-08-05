#kafka
#
#VERSION 0.0.1

FROM moonnoon/base:latest
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN mkdir -p /opt/kafka/
RUN wget -q -O - https://archive.apache.org/dist/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz | \
tar -zxf - -C /opt/kafka/ --strip-components=1

ADD http://repo1.maven.org/maven2/org/slf4j/slf4j-log4j12/1.7.7/slf4j-log4j12-1.7.7.jar /opt/kafka/libs/slf4j-log4j12-1.7.7.jar

WORKDIR /opt/kafka/

ADD ./startup.sh /opt/kafka/startup.sh
CMD ["/opt/kafka/startup.sh"]