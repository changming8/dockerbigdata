#!/bin/bash
#
#startup.sh

export ZK_IP=$(cat /etc/hosts | grep zookeeper | cut -f1)
export TOPIC=test

#configure
sed -i -e"s/^#advertised.host.name=<hostname routable by clients>/advertised.host.name=$(hostname -i)/" /opt/kafka/config/server.properties
sed -i -e"s/^zookeeper.connect=zookeeper:2181/zookeeper.connect=$ZK_IP:2181/" /opt/kafka/config/server.properties

#start kafka server
bin/kafka-server-start.sh config/server.properties &
sleep 1s

#create a topic "test" with single partion and only one replica
bin/kafka-topics.sh --create --zookeeper $ZK_IP:2181 --replication-factor 1 --partitions 1 --topic $TOPIC

#keep foregroud
sleep 1s
%
vim

#start a consumer
#bin/kafka-console-consumer.sh --zookeeper $ZK_IP:2181 --topic $TOPIC --from-beginning
