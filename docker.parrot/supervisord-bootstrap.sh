#!/bin/bash

: ${PORT:=8000}

supervisorctl start kafka-connect-ui

/wait-for-it.sh localhost:$PORT -t 20
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n--------------------------------------------"
    echo -e "   Kafka Topics UI not ready! Exiting..."
    echo -e "--------------------------------------------"
    exit $rc
fi

echo -e "\n\n--------------------------------------------------------------------------------"
echo -e "You can now access to the Kafka Connect UI:\n"
echo -e "\tKafka Connect UI:   http://localhost:$PORT"
echo -e "\nMantainer:   Matteo Capitanio <matteo.capitanio@gmail.com>"
echo -e "--------------------------------------------------------------------------------\n\n"




