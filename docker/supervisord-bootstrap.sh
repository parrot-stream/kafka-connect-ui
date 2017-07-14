#!/bin/bash

: ${KAFKA_CONNECT_UI_PORT:=8000}

sed -i "s/8000/${KAFKA_CONNECT_UI_PORT}/g" /caddy/Caddyfile

supervisorctl start kafka-connect-ui

echo -e "\n\n--------------------------------------------------------------------------------"
echo -e "You can now access to the Kafka Connect UI:\n"
echo -e "\tKafka Connect UI:   http://localhost:$KAFKA_CONNECT_UI_PORT"
echo -e "\nMantainer:   Matteo Capitanio <matteo.capitanio@gmail.com>"
echo -e "--------------------------------------------------------------------------------\n\n"




